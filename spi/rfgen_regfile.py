
class RegMapRegFileGenerator:
  def __init__(self):
    self.addrs_dict   = {}
    self.reg_total    = 0
    self.field_list   = []
    self.msb_dict     = {}
    self.lsb_dict     = {}
    self.io_dict      = {}
    self.sram_io_dict = {}
    self.we_dict      = {}
    self.width_dict   = {}
    self.cell_dict    = {}
    self.DATA_WIDTH   = 16
    self.ADDR_WIDTH   = 10

  def handle_regfile_config(self, config):
    regfile_contents = config["regs"]
    self.addrs_dict  = config["addrs"]
    self.addr_list   = sorted(self.addrs_dict.keys())
    for name, field in regfile_contents.iteritems():
      addr     = field["addr"]
      reg_addr = '%0*x' % (3, addr)
      self.reg_total += 1
      msb    = field["msb"]
      lsb    = field["lsb"]
      access = field["access"]
      init   = hex(field["init"])
      desc   = field["desc"]
      width  = msb - lsb + 1

      # print '  Reg%d: [%s:%s] %s %s %s' % (idx, msb, lsb, access, init, desc)

      self.msb_dict[name] = msb
      self.lsb_dict[name] = lsb

      self.field_list.append(name)
      self.width_dict[name] = width
      self.cell_dict[name]  = self.construct_regmap_cell(name, access, width, init, desc)

      if "WR" == access:
        self.io_dict[name]      = (None, "%s_out_o" % name)
        self.sram_io_dict[name] = ("%s_sram_in" % name, "%s_sram_out" % name)
        self.we_dict[name]      = "%s_we" % name
      elif "RD" == access:
        self.io_dict[name]      = ("%s_in_i" % name, None)
        self.sram_io_dict[name] = (None, "%s_sram_out" % name)
        self.we_dict[name]      = None
      elif "CONST" == access:
        self.io_dict[name]      = (None, None)
        self.sram_io_dict[name] = (None, "%s_sram_out" % name)
        self.we_dict[name]      = None
      else:
        print "Access error"
        return False

    return True

  def construct_regmap_cell(self, name, access, width, init, desc):
    cell_contents = ["  // %s\n" % desc,]
    if access == "WR":
      cell_contents.extend([
        "  regmap_cell_wr #(.DATA_WIDTH(%d), .RST_VAL(%d'h%s))\n" % (width, width, init.split('x')[1]),
        "    %s(\n" % name,
        "    .clk_i       (clk_i),\n",
        "    .rstb_i      (rstb_i),\n",
        "    .we_i        (%s_we),\n" % name,
        "    .sram_data_i (%s_sram_in),\n" % name,
        "    .data_o      (%s_data_out)\n" % name,
        "  );\n"
				"  assign %s_sram_out = %s_data_out;\n" % (name, name),
				"  assign %s_out_o    = %s_data_out;\n" % (name, name),
      ])
    elif access == "RD":
      cell_contents.extend([
        "  regmap_cell_rd #(.DATA_WIDTH(%d), .RST_VAL(%d'h%s))\n" % (width, width, init.split('x')[1]),
        "    %s(\n" % name,
        "    .clk_i       (clk_i),\n",
        "    .rstb_i      (rstb_i),\n",
        "    .sram_data_o (%s_sram_out),\n" % name,
        "    .ana_data_i  (%s_in_i)\n" % name,
        "  );\n"
      ])
    elif access == "CONST":
      cell_contents.extend([
        "  assign %s_sram_out = %d'h%s;\n" % (name, width, init.split('x')[1])
      ])
    else:
      print "ERROR Access: %s" % access

    return cell_contents


  def gen_analog_io(self):
    contents = []
    for name in self.field_list:
      io_in  = self.io_dict[name][0]
      io_out = self.io_dict[name][1]
      width  = self.width_dict[name]

      if io_in is not None:
        if width-1 == 0:
          contents.append("  input         %s,\n" % io_in)
        else:
          contents.append("  input  [%d:0] %s,\n" % (width-1, io_in))
      if io_out is not None:
        if width-1 == 0:
          contents.append("  output        %s,\n" % io_out)
        else:
          contents.append("  output [%d:0] %s,\n" % (width-1, io_out))

    return contents

  def gen_internal_variables(self):
    contents = []

    for name in self.field_list:
      io_in  = self.sram_io_dict[name][0]
      io_out = self.sram_io_dict[name][1]
      we     = self.we_dict[name]
      width  = self.width_dict[name]

      if we is not None:
        contents.append("  reg        %s;\n" % we)
      if io_in is not None:
        if width-1 == 0:
          contents.append("  reg        %s;\n" % io_in)
        else:
          contents.append("  reg  [%d:0] %s;\n" % (width-1, io_in))
      if io_out is not None:
        if width-1 == 0:
          contents.append("  wire       %s;\n" % io_out)
          contents.append("  wire       %s;\n" % io_out.replace("sram", "data"))
        else:
          contents.append("  wire [%d:0] %s;\n" % (width-1, io_out))
          contents.append("  wire [%d:0] %s;\n" % (width-1, io_out.replace("sram", "data")))
      contents.append("\n")

    contents.append("\n")

    return contents

  def gen_register_instantiation(self):
    contents = []

    for name in self.field_list:
      cell = self.cell_dict[name]
      contents.extend(cell)
      contents.append("\n")

    contents.append("\n")

    return contents

  def gen_analog_we_default(self):
    contents = []

    for name in self.field_list:
      we = self.we_dict[name]
      if we is not None:
        contents.append("    %s = 1'b0;\n" % we)
    contents.append("\n")

    return contents

  def gen_analog_we(self):
    contents = []

    for addr in self.addr_list:
      addr_has_we = False
      addr_we_block = []
      addr_we_block.append("        %d'h%s: begin\n" % (self.ADDR_WIDTH, '%0*x' % (3, addr)))
      for name in self.addrs_dict[addr]["regs"]:
        we   = self.we_dict[name]
        if we is not None:
          addr_has_we = True
          addr_we_block.append("          %s = 1'b1;\n" % we)
      addr_we_block.append("          error_r = 1'b0;\n")
      addr_we_block.append("        end\n")
      if addr_has_we:
        contents.extend(addr_we_block)

    return contents

  def gen_analog_we_default_case(self):
    contents = []
    for name in self.field_list:
      we = self.we_dict[name]
      if we is not None:
        contents.append("          %s = 1'b0;\n" % we)

    return contents

  def gen_analog_read(self):
    contents = []

    for addr in self.addr_list:
      addr_has_read = False
      addr_read_block = []
      addr_read_block.append("        %d'h%s: begin\n" % (self.ADDR_WIDTH, '%0*x' % (3, addr)))

      for name in self.addrs_dict[addr]["regs"]:
        sram_out   = self.sram_io_dict[name][1]
        if sram_out is not None:
          reg_name = sram_out.replace("_sram_out", "")
          addr_has_read = True
          msb = self.msb_dict[reg_name]
          lsb = self.lsb_dict[reg_name]
          addr_read_block.append("          data_out[%s:%s] = %s;\n" % (msb, lsb, sram_out))

      addr_read_block.append("          error_r = 1'b0;\n")
      addr_read_block.append("        end\n")

      if addr_has_read:
        contents.extend(addr_read_block)

    return contents

  def gen_cell_write_logic(self):
    contents = []
    for name in self.field_list:
      sram_in = self.sram_io_dict[name][0]

      if sram_in is not None:
        reg_name = sram_in.replace("_sram_in", "")
        msb = self.msb_dict[reg_name]
        lsb = self.lsb_dict[reg_name]
        contents.append("    %s = data_i[%d:%d];\n" % (sram_in, msb, lsb))

    return contents

  def gen(self, config, template):
    contents = []
    if self.handle_regfile_config(config):
      for line in template:
        if "{%" in line:
          if "{% Analog Interface IO %}" in line:
            contents.append("  //-----Analog Interface IO-------\n")
            contents.extend(self.gen_analog_io())
          elif "{% Analog Internal Variables %}" in line:
            contents.append("  // Analog Internal Variables\n")
            contents.extend(self.gen_internal_variables())
          elif "{% Analog Registers Instantiation %}" in line:
            contents.extend(self.gen_register_instantiation())
          elif "{% Analog Write Enable Default Value %}" in line:
            contents.extend(self.gen_analog_we_default())
          elif "{% Analog Write Enable %}" in line:
            contents.extend(self.gen_analog_we())
          elif "{% Analog Read Enable %}" in line:
            contents.extend(self.gen_analog_read())
          elif "{% Analog Write %}" in line:
            contents.extend(self.gen_cell_write_logic())
          else:
            print "WARNNING!"
            print line
        else:
          contents.append(line)

    return contents


