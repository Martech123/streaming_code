import sys
import copy
import time
from random import randint, seed

class RegMapRegFileTBGenerator:
  def __init__(self, config):
    # self.seed = time.time()
    self.seed = 1520330793.11
    seed(self.seed)
    print "SEED: ", self.seed
    self.config        = config
    self.ana_total     = 0
    self.ana_bits_total = 0
    self.dig_total     = 0
    self.dig_bits_total = 0
    self.init_dict     = {}
    self.loc_dict      = {}
    self.region_dict   = {}
    self.ana_field_list = []
    self.dig_field_list = []
    self.addr_list     = []
    self.wr_addr_list     = []
    self.addr_dict     = {}
    self.msb_dict      = {}
    self.lsb_dict      = {}
    self.we_field_dict = {}
    self.rd_field_dict = {}
    self.io_dict       = {}
    self.we_dict       = {}
    self.width_dict    = {}
    self.reg_wrmask_dict = {}
    self.field_rdmask_dict = {}
    self.field_wrmask_dict = {}
    self.regfile_dict  = {}
    self.sram_testcase_dict = {}
    self.ana_io_block  = []
    self.dig_io_block  = []
    self.regfile_dut   = []
    self.read_error_dict  = {}
    self.write_error_dict = {}
    self.dummy_ana_block = []
    self.DATA_WIDTH    = 16
    self.ADDR_WIDTH    = 10

  def rev_idx(self, idx):
    return self.DATA_WIDTH - 1 - idx

  def rw_field(self, name, val):
    addr = self.addr_dict[name]
    reg  = self.regfile_dict[addr]
    lidx = self.rev_idx(self.msb_dict[name])
    ridx = self.rev_idx(self.lsb_dict[name])

    if val is None:
      return reg[lidx:ridx+1]
    elif type(val) == type(""):
      if self.we_dict[name] != None:
        wval = val[lidx:ridx+1]
        self.regfile_dict[addr] = reg[0:lidx] + wval + reg[ridx+1:self.DATA_WIDTH]
    else:
      print "ERROR: val should be string."
      sys.exit(-1)

  def write_to_reg(self, addr, val):
    if type(val) == type(""):
      if not val.isdigit():
        print "ERROR: not a val"
        print val
        sys.exit(-1)
      write_val = val
    else:
      write_val = format(val & (2 ** self.DATA_WIDTH-1), "0%db" % self.DATA_WIDTH)

    if '-' in write_val:
      print val
      print write_val
    for field_name in self.we_field_dict[addr]:
      self.rw_field(field_name, write_val)

  def read_from_reg(self, addr):
      return self.regfile_dict[addr]

  def handle_regfile_config(self, config):
    regfile_contents = config["regs"]
    self.addr_list   = sorted(config["addrs"].keys())
    orig_rdmask        = format(0, "0%db" % self.DATA_WIDTH)
    orig_wrmask        = format(2**self.DATA_WIDTH-1, "0%db" % self.DATA_WIDTH)
    for addr in self.addr_list:
      self.reg_wrmask_dict[addr]  = 0
      self.we_field_dict[addr] = []
      self.rd_field_dict[addr] = []
      self.regfile_dict[addr] = format(0, "0%db" % self.DATA_WIDTH)
      self.sram_testcase_dict[addr] = randint(0, 2**self.DATA_WIDTH)

    for name, field in regfile_contents.iteritems():
      addr     = field["addr"]
      read_error  = 1
      write_error = 1

      msb    = field["msb"]
      lsb    = field["lsb"]
      access = field["access"]
      init   = field["init"]
      desc   = field["desc"]
      dest   = field["dest"]
      width  = msb - lsb + 1

      self.addr_dict[name] = addr
      self.msb_dict[name]  = msb
      self.lsb_dict[name]  = lsb

      if dest.lower() == "analog":
        self.loc_dict[name] = field["location"]
        self.region_dict[name] = field["region"]
        self.ana_field_list.append(name)
        self.ana_total += 1
        self.ana_bits_total += width
      elif dest.lower() == "digital":
        self.dig_field_list.append(name)
        self.dig_total += 1
        self.dig_bits_total += width
      else:
        print "ERROR: Destination Invalid!"
        print dest
        sys.exit(-1)

      self.width_dict[name] = width
      self.init_dict[name]  = hex(init)

      lidx     = self.rev_idx(self.msb_dict[name])
      ridx     = self.rev_idx(self.lsb_dict[name])
      orig_reg = self.regfile_dict[addr]
      init_bin = format(init, "0%db" % width)

      self.regfile_dict[addr]    = orig_reg[0:lidx] + init_bin + orig_reg[ridx+1:self.DATA_WIDTH]
      self.field_rdmask_dict[name] = int(orig_rdmask[0:lidx] + bin(2**width-1)[2:] + orig_rdmask[ridx+1:self.DATA_WIDTH], 2)
      self.field_wrmask_dict[name] = int(orig_wrmask[0:lidx] + bin(2**width)[3:] + orig_wrmask[ridx+1:self.DATA_WIDTH], 2)

      if "WR" == access:
        self.io_dict[name] = (None, "%s_out_o" % name)
        self.we_dict[name] = "%s_we" % name
        self.we_field_dict[addr].append(name)
        self.rd_field_dict[addr].append(name)
        read_error  = 0
        write_error = 0
        self.reg_wrmask_dict[addr] |= self.field_rdmask_dict[name]
      elif "RD" == access:
        self.io_dict[name] = ("%s_in_i" % name, None)
        self.we_dict[name] = None
        self.rd_field_dict[addr].append(name)
        read_error  = 0
      elif "CONST" == access:
        self.io_dict[name] = (None, None)
        self.we_dict[name] = None
        self.rd_field_dict[addr].append(name)
        read_error  = 0
        self.reg_wrmask_dict[addr] |= self.field_rdmask_dict[name]
      else:
        print "Access error"
        return False

      self.read_error_dict[addr]  = read_error
      self.write_error_dict[addr] = write_error

    return True

  def construct_assert_block(self, assert_list, comment, msg, cycles=None):
    assert type(assert_list) == type([])
    if cycles is not None:
      step = "# (STEP * %d)" % cycles
    else:
      step = "# STEP"

    block_contents = []
    block_contents.extend([
      "    // %s.\n" % comment,
      "    %s begin\n" % step,
    ])

    if assert_list != []:
      block_contents.append("      if (\n")
      for item in assert_list:
        block_contents.append(item)

      block_contents.extend([
        "      ) begin\n",
        "        $display(\"%s succeed!\");\n" % msg,
        "      end else begin\n",
        "        $display(\"%s failed!\");\n" % msg,
        "      end\n",
      ])

    return block_contents


  def gen_regfile_ana_connection(self):
    #----- Generate list -----
    # Digital IO list
    dig_io_list  = []
    reg_list     = []
    rf_list      = []
    ana_list     = []

    for name in self.dig_field_list + self.ana_field_list:
      width  = self.width_dict[name]

      if self.io_dict[name][0] is not None:
        io_in  = self.io_dict[name][0].replace("in_i", "in")
        rf_list.append("    .%s (%s),\n" % (self.io_dict[name][0], io_in))

      if self.io_dict[name][1] is not None:
        io_out = self.io_dict[name][1].replace("out_o", "out")
        rf_list.append("    .%s (%s),\n" % (self.io_dict[name][1], io_out))

    for name in self.ana_field_list:
      width  = self.width_dict[name]

      if self.io_dict[name][0] is not None:
        io_in  = self.io_dict[name][0].replace("in_i", "in")
        if width-1 == 0:
          reg_list.append("  wire        %s;\n" % io_in)
        else:
          reg_list.append("  wire [%d:0] %s;\n" % (width-1, io_in))

      if self.io_dict[name][1] is not None:
        io_out = self.io_dict[name][1].replace("out_o", "out")
        if width-1 == 0:
          reg_list.append("  wire        %s;\n" % io_out)
        else:
          reg_list.append("  wire [%d:0] %s;\n" % (width-1, io_out))

    for name in self.dig_field_list:
      width  = self.width_dict[name]

      if self.io_dict[name][0] is not None:
        io_in  = self.io_dict[name][0].replace("in_i", "in")

        if width-1 == 0:
          dig_io_list.append("  input        %s,\n" % io_in)
        else:
          dig_io_list.append("  input [%d:0] %s,\n" % (width-1, io_in))

      if self.io_dict[name][1] is not None:
        io_out = self.io_dict[name][1].replace("out_o", "out")

        if width-1 == 0:
          dig_io_list.append("  output        %s,\n" % io_out)
        else:
          dig_io_list.append("  output [%d:0] %s,\n" % (width-1, io_out))

    for name in self.ana_field_list:
      width  = self.width_dict[name]

      io_in  = self.io_dict[name][0]
      io_out = self.io_dict[name][1]

      # Generate Analog IO List, inverse io direction for dummy_analog view.
      if io_in is not None:
        ana_list.append("    .%s (%s),\n" % (io_in.replace("_in_i", ""), io_in.replace("in_i", "in")))
      if io_out is not None:
        ana_list.append("    .%s (%s),\n" % (io_out.replace("_out_o", ""), io_out.replace("out_o", "out")))

    # Analog Register
    self.ana_io_block.append("  // Analog Registers IO\n")
    self.ana_io_block.extend(reg_list)

    # Digital Register IO
    self.dig_io_block.append("  // Digital Registers IO\n")
    self.dig_io_block.extend(dig_io_list)

    # Register File
    self.regfile_dut.extend(rf_list)

    # Dummy Analog
    self.dummy_ana_block.extend(ana_list)

  def gen_analog_io_declaration(self):
    contents = []
    contents.extend(self.ana_io_block)
    contents.append("\n")

    return contents

  def gen_testcase_init(self):
    contents = []
    contents.extend([
      "\n  initial begin\n",
      "    // Reset\n",
      "    begin\n",
      "      rf_clk_i  <= 1'h1;\n",
      "      rf_rstb_i <= 1'h0;\n",
      "      rf_we_i   <= 1'h0;\n",
      "      rf_ce_i   <= 1'h0;\n",
      "      rf_addr_i <= 1'h0;\n",
      "      rf_wdata_i <= 1'h0;\n",

    ])

    contents.extend([
      "    end\n",
      "    # (STEP * 3/4)\n",
    ])
    contents.append("\n")
    return contents

  def gen_assert_list(self, addr=None, rw=None, valid=1):
    assert_list = []
    if addr is None or rw == "write":
      right_data = "0"
    else:
      right_data = self.read_from_reg(addr)

    if rw == "write":
      assert_list.append("        rf_error_o == 1'b%d && // %s \n" % (self.write_error_dict[addr], hex(addr)))
    elif rw == "read":
      assert_list.append("        rf_error_o == 1'b%d && // %s\n" % (self.read_error_dict[addr], hex(addr)))

    assert_list.extend([
      "        rf_valid_o == 1'b%d  &&\n" % valid,
      "        rf_rdata_o  == %d'b%s &&\n" % (self.DATA_WIDTH, right_data),
    ])

    for name in self.ana_field_list:
      io_in    = self.io_dict[name][0]
      width    = self.width_dict[name]
      out_data = self.rw_field(name, None)

      if io_in is not None:
        assert_list.append("        %s == %d'b%s  &&\n" % (io_in.replace("in_i", "in"), width, out_data))

    assert_list[-1] = assert_list[-1].replace("&&", "")

    return assert_list

  def gen_assert_reset(self):
    contents    = []
    assert_list = []

    contents.extend(
      self.construct_assert_block(self.gen_assert_list(valid=0), "Read Data from Analog", "Reset")
    )

    contents.extend([
      "      rf_rstb_i <= 1'b1;\n",
      "    end\n",
    ])

    return contents

  def gen_testcase_read_from_ana(self):
    contents = []

    first_addr = '%0*x' % (3, self.addr_list[0])
    contents.extend([
      "    // Read Data from %s\n" % first_addr,
      "    # STEP begin\n",
      "      rf_ce_i <= 1'h1;\n",
      "      rf_addr_i  <= %d'h%s;\n" % (self.ADDR_WIDTH, first_addr),
      "    end\n",
    ])

    for i in range(len(self.addr_list)):
      end = []
      current_addr = self.addr_list[i]
      msg     = "Read Data from %s" % ('%0*x' % (3, current_addr))

      if i+1 < len(self.addr_list):
        next_addr = '%0*x' % (3, self.addr_list[i+1])
        comment = "Read Data from %s" % next_addr
        end.extend([
          "      rf_ce_i <= 1'h1;\n",
          "      rf_addr_i  <= %d'h%s;\n" % (self.ADDR_WIDTH, next_addr),
          "    end\n",
        ])
      else:
        comment = "Read Data from %s" % ('%0*x' % (3, current_addr))
        end.extend([
          "      rf_ce_i <= 1'h0;\n",
          "    end\n",
        ])

      contents.extend(
        self.construct_assert_block(self.gen_assert_list(current_addr, "read"), comment, msg, 3))

      contents.extend(end)
    return contents

  def gen_testcase_write_to_ana(self):
    contents = []
    for idx, test_addr in enumerate(self.addr_list):
      if idx != 0:
        pre_addr = self.addr_list[idx-1]
        assert_list = self.gen_assert_list(pre_addr, "write")
      else:
        assert_list = []

      prev_addr = '%0*x' % (3, self.addr_list[idx-1])
      curr_addr = '%0*x' % (3, test_addr)
      contents.extend(
        self.construct_assert_block(assert_list, "Write Data to 0x%s" % curr_addr, "Check Data in 0x%s" % prev_addr )
      )

      test_data = format(self.sram_testcase_dict[test_addr], "0%db" % self.DATA_WIDTH)

      contents.extend([
        "\n",
        "      rf_we_i   <= 1'h1;\n",
        "      rf_addr_i <= %d'h%s;\n" % (self.ADDR_WIDTH, curr_addr),
        "      rf_wdata_i <= %d'b%s;\n" % (self.DATA_WIDTH, test_data),
        "      rf_ce_i   <= 1'b1;\n",
      ])

      self.write_to_reg(test_addr, int(test_data, 2))

      contents.append("    end\n")

    last_addr = '%0*x' % (3, self.addr_list[-1])
    assert_list = self.gen_assert_list(self.addr_list[-1], "write")

    contents.extend(
      self.construct_assert_block(assert_list, "Check Data in 0x%s" % last_addr, "Check Data in 0x%s" % last_addr )
    )

    contents.append("      rf_ce_i   <= 1'b0;\n")
    contents.append("      rf_we_i   <= 1'b0;\n")
    contents.append("    end\n")

    return contents

  def gen_dummy_analog(self, template):
    #----- Generate list -----
    io_list     = []
    reg_list    = []
    init_list   = []
    input_list  = []
    output_list = []

    for name in self.ana_field_list:
      io_in  = self.io_dict[name][0]
      io_out = self.io_dict[name][1]
      width  = self.width_dict[name]
      init   = self.init_dict[name]

      # Generate Register List
      if width-1 == 0:
        reg_list.append("  reg        %s_inner;\n" % name)
      else:
        reg_list.append("  reg [%d:0] %s_inner;\n" % (width-1, name))

      # Generate Initial List
      init_list.append("    %s_inner = %d'h%s;\n" % (name, width, init.split('x')[1]))

      # Generate IO List, inverse io direction for dummy_analog view.
      if io_in is not None:
        if width-1 == 0:
          io_list.append("  output        %s,\n" % io_in.replace("_in_i", ""))
        else:
          io_list.append("  output [%d:0] %s,\n" % (width-1, io_in.replace("_in_i", "")))
      if io_out is not None:
        if width-1 == 0:
          io_list.append("  input         %s,\n" % io_out.replace("_out_o", ""))
        else:
          io_list.append("  input  [%d:0] %s,\n" % (width-1, io_out.replace("_out_o", "")))

      # Generate Output List
      if io_in is not None:
        output_list.append("  assign %s = %s_inner;\n" % (io_in.replace("_in_i", ""), name))

      # Generate Input List
      if io_out is not None:
        input_list.append("    %s_inner = %s;\n" % (name, io_out.replace("_out_o", "")))

    #----- Construct Blocks -----
    contents = []
    for line in template:
      if "{%" in line:
        if "{% Dummy_Analog_IO %}" in line:
          contents.append("  // Dummy Analog IO\n")
          contents.extend(io_list)
        elif "{% Analog_Registers %}" in line:
          contents.append("  // Analog Registers\n")
          contents.extend(reg_list)
        elif "{% Initialization %}" in line:
          contents.extend([
            "\n  // Initialization\n",
            "  initial begin\n",
          ])
          contents.extend(init_list)
          contents.append("  end\n")
        elif "{% Output Logic %}" in line:
          contents.extend("  // Output Logic\n")
          contents.extend(output_list)
        elif "{% Input Logic %}" in line:
          contents.extend([
            "\n  // Input Logic\n",
            "  always @(*) begin\n",
          ])
          contents.extend(input_list)
          contents.extend("  end\n")
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    return contents

  def gen_dummy_digital(self, template):
    #----- Generate list -----
    io_list     = []
    reg_list    = []
    init_list   = []
    input_list  = []
    output_list = []

    for name in self.ana_field_list:
      io_in  = self.io_dict[name][0]
      io_out = self.io_dict[name][1]
      width  = self.width_dict[name]
      init   = self.init_dict[name]

      # Generate IO List, inverse io direction for dummy_analog view.
      if io_in is not None:
        # Generate Input List if it used as Input
        input_list.append("    %s_inner = %s;\n" % (name, io_in.replace("_in_i", "")))
        if width-1 == 0:
          io_list.append("  input        %s,\n" % io_in.replace("_in_i", ""))
        else:
          io_list.append("  input [%d:0] %s,\n" % (width-1, io_in.replace("_in_i", "")))
      if io_out is not None:
        # Generate Initial List if it used as output
        init_list.append("    %s_inner = %d'h%s;\n" % (name, width, init.split('x')[1]))
        # Generate Output List if it used as output
        output_list.append("  assign %s = %s_inner;\n" % (io_out.replace("_out_o", ""), name))
        # Generate Register List if it used as output
        if width-1 == 0:
          reg_list.append("  reg        %s_inner;\n" % name)
          io_list.append("  output         %s,\n" % io_out.replace("_out_o", ""))
        else:
          reg_list.append("  reg [%d:0] %s_inner;\n" % (width-1, name))
          io_list.append("  output  [%d:0] %s,\n" % (width-1, io_out.replace("_out_o", "")))

    #----- Construct Blocks -----
    contents = []
    for line in template:
      if "{%" in line:
        if "{% Dummy_Digital_IO %}" in line:
          contents.append("  // Dummy Digital IO\n")
          io_list[-1].replace(",", "")
          contents.extend(io_list)
        elif "{% Digital_Registers %}" in line:
          contents.append("  // Digital Registers\n")
          contents.extend(reg_list)
        elif "{% Initialization %}" in line:
          contents.extend([
            "\n  // Initialization\n",
            "  initial begin\n",
          ])
          contents.extend(init_list)
          contents.append("  end\n")
        elif "{% Output Logic %}" in line:
          contents.extend("  // Output Logic\n")
          contents.extend(output_list)
        elif "{% Input Logic %}" in line:
          contents.extend([
            "\n  // Input Logic\n",
            "  always @(*) begin\n",
          ])
          contents.extend(input_list)
          contents.extend("  end\n")
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    return contents


  def gen_analog2(self, template):
    contents = []
    # Module IO
    for line in template:
      if "{%" in line:
        if "{% Digital IO %}" in line:
          contents.extend(self.dig_io_block)
        elif "{% Analog_Registers_IO %}" in line:
          contents.extend(self.ana_io_block)
        elif "{% Analog_Interface %}" in line:
          contents.extend(self.regfile_dut)
        elif "{% Dummy_Analog_Interface %}" in line:
          contents.extend(self.dummy_ana_block)
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    return contents

  # gen C Header File
  def gen_cheader(self):
    contents = []
    for name in self.ana_field_list + self.dig_field_list:
      contents.extend([
        "#define %s_RDMASK (%s)\n" % (name, hex(self.field_rdmask_dict[name])),
        "#define %s_WRMASK (%s)\n" % (name, hex(self.field_wrmask_dict[name])),
        "#define %s_LSB (%d)\n" % (name, self.lsb_dict[name]),
        "#define %s_GET(reg) \\\n" % name,
        "  (((reg) & %s_RDMASK) >> %s_LSB)\n" % (name, name),
        "#define %s_SET(reg, val) \\\n" % name,
        "  {reg = ((reg) & %s_WDMASK) | ((val) << %s_LSB;}\n\n" % (name, name),
      ])

    return contents

  def gen_pin_loc(self, other_config):
    pin_loc_tuples = []
    with open(other_config, "r") as f:
      for line in f.readlines():
        line = line.split()
        line[-1] = int(line[-1])
        pin_loc_tuples.append(tuple(line))

    for field in sorted(self.loc_dict, key=self.loc_dict.get):
      if self.we_dict[field] is None:
        name = field
      else:
        name = field

      pin_loc_tuples.append((self.region_dict[field], name, self.loc_dict[field]))

    contents = []
    dbg_contents = []
    for pin in sorted(pin_loc_tuples, key=lambda x: x[2]):
      contents.append(" ".join([str(item) for item in list(pin)[:-1]])+"\n")
      dbg_contents.append(" ".join([str(item) for item in list(pin)])+"\n")

    return (contents, dbg_contents)

  def is_addr_all_rd(self, addr):
    addrs_dict = self.config["addrs"]
    for name in addrs_dict[addr]["regs"]:
      if self.we_dict[name] is not None:
        return False

    return True

  def gen_spi_pattern(self, times):
    print "Generate SPI test %d." % times
    orig_rf_dict = {}
    orig_rf_dict = copy.deepcopy(self.regfile_dict)
    contents          = []
    wdata_rand        = []
    wdata_rand_invert = []

    addrs_dict = self.config["addrs"]

    test_total = range(times)

    #reset_cpu = "%s%s%s\n" % ('{0:0>16b}'.format(0xc000), '{0:0>10b}'.format(0x148), '{0:0>16b}'.format(0x4000))
    reset_pinmux = "%s%s%s\n" % ('{0:0>16b}'.format(0xffff), '{0:0>10b}'.format(0x120), '{0:0>16b}'.format(0x0000))
    contents.append(reset_pinmux)

    for test_cnt in test_total:
      for addr in sorted(addrs_dict.keys()):
        if self.is_addr_all_rd(addr) or addr == 0x120:
          continue
        reg_wrmask      = self.reg_wrmask_dict[addr]
        reg_value       = '{0:0>4x}'.format(int(self.read_from_reg(addr), 2))
        addr_bin        = '{0:0>10b}'.format(addr)

        test_data       = randint(0, 2**self.DATA_WIDTH)
        invert_data     = 2**16-1-test_data

        test_data_hex   = '{0:0>4x}'.format(test_data)
        invert_data_hex = '{0:0>4x}'.format(invert_data)

        wrmask_value = '{0:0>16b}'.format(reg_wrmask)

        # Write Random Value
        self.write_to_reg(addr, test_data)
        reg_value = '{0:0>16b}'.format(int(self.read_from_reg(addr), 2))

        wdata_rand.extend([
          "%s%s%s\n" % (wrmask_value, addr_bin, reg_value),
        ])

        # Write Invert Random Value
        self.write_to_reg(addr, invert_data)
        reg_value = '{0:0>16b}'.format(int(self.read_from_reg(addr), 2))

        wdata_rand_invert.extend([
          "%s%s%s\n" % (wrmask_value, addr_bin, reg_value),
        ])

      contents.extend(wdata_rand)
      contents.extend(wdata_rand_invert)
      contents.append('{0:0>26b}\n'.format(0x3ffbeef))
    contents[-1] = '{0:0>26b}'.format(0x3ffdead)
    self.regfile_dict = copy.deepcopy(orig_rf_dict)
    return contents

  # Generate Testcase for writing then reading value of WR regs.
  def gen_testapp_rw(self, template):
    contents  = []
    rw_value  = []

    addrs_dict = self.config["addrs"]

    for addr in sorted(addrs_dict.keys()):
      if self.is_addr_all_rd(addr) or (addr >= 0x180 and addr <= 0x1870) or (addr == 0x120):
        continue
      else:
        reg_value  = randint(0, 2**self.DATA_WIDTH)
        addr_bin   = '{0:0>10b}'.format(addr)
        addr_hex   = '{0:0>3x}'.format(addr)
        op_r_bin   = '{0:0>6b}'.format(0)
        op_w_bin   = '{0:0>6b}'.format(1)
        read_hex   = '0x{0:0>4x}'.format(int(op_r_bin+addr_bin, 2))
        write_hex  = '0x{0:0>4x}'.format(int(op_w_bin+addr_bin, 2))
        reg_wrmask = self.reg_wrmask_dict[addr]

        # Default Value
        rw_value.extend([
          "  // Write value to 0x%s\n" % addr_hex,
          "  rfreq(%s%s, 0xffff);\n" % (write_hex, '{0:0>4x}'.format(reg_value)),
          "  // Read value of 0x%s\n" % addr_hex,
          "  // %s\n" % addrs_dict[addr]["desc"],
          "  reg_test(%s0000, %s, %s, \"0x%s\");\n" % (read_hex, hex(reg_wrmask), hex(reg_wrmask & reg_value), addr_hex)
        ])

    for line in template:
      if "{%" in line:
        if "{% Write then read Value %}" in line:
          contents.extend(rw_value)
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    return contents

  # Generate Testcase for reading default value of WR regs.
  def gen_testapp_default_wr(self, template):
    contents          = []
    wr_default_value  = []

    addrs_dict = self.config["addrs"]

    for addr in sorted(addrs_dict.keys()):
      if self.is_addr_all_rd(addr) or (addr >= 0x180 and addr <= 0x1870):
        continue
      else:
        reg_value = int(self.read_from_reg(addr), 2)
        addr_bin  = '{0:0>10b}'.format(addr)
        addr_hex  = '{0:0>3x}'.format(addr)
        op_r_bin  = '{0:0>6b}'.format(0)
        read_hex  = '0x{0:0>4x}'.format(int(op_r_bin+addr_bin, 2))
        reg_wrmask = self.reg_wrmask_dict[addr]

        # Default Value
        wr_default_value.extend([
          "  // Read default value of 0x%s\n" % addr_hex,
          "  // %s\n" % addrs_dict[addr]["desc"],
          "  reg_test(%s0000, %s, %s, \"0x%s\");\n" % (read_hex, reg_wrmask, reg_wrmask & reg_value, addr_hex)
        ])

    for line in template:
      if "{%" in line:
        if "{% Check WR Default Value %}" in line:
          contents.extend(wr_default_value)
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    return contents

  def gen_testapp(self, template):
    orig_rf_dict = {}
    orig_rf_dict = copy.deepcopy(self.regfile_dict)
    contents          = []
    default_value     = []
    wdata_rand        = []
    wdata_rand_invert = []

    addrs_dict = self.config["addrs"]

    for addr in sorted(addrs_dict.keys()):
      reg_value       = '{0:0>4x}'.format(int(self.read_from_reg(addr), 2))
      addr_bin        = '{0:0>10b}'.format(addr) 
      addr_hex        = '{0:0>3x}'.format(addr) 
      op_r_bin        = '{0:0>6b}'.format(0)
      op_w_bin        = '{0:0>6b}'.format(1)
      read_hex        = '0x{0:0>4x}'.format(int(op_r_bin+addr_bin, 2))
      write_hex       = '0x{0:0>4x}'.format(int(op_w_bin+addr_bin, 2))

      test_data       = self.sram_testcase_dict[addr]
      # Trick: AON_HFCLK_GATE_FORCE always 0 when test.
      if "AON_HFCLK_GATE_FORCE" in addrs_dict[addr]["regs"]:
        test_data &= 65527

      test_data_hex   = '{0:0>4x}'.format(test_data)
      invert_data     = abs(~test_data)
      invert_data_hex = '{0:0>4x}'.format(invert_data)

      # Default Value
      default_value.extend([
        "  // Read default value of 0x%s\n" % addr_hex,
        "  // %s\n" % addrs_dict[addr]["desc"],
        "  REQ(%s0000)\n" % read_hex,
        "  WAIT\n",
        "  ASSERT(0x0%s%s, \"0x%s Default Err!\\n\")\n\n" % (addr_hex, reg_value, addr_hex),
        # "  print_str(\"TEST PASSED: %s\\n\");" % addr_hex,
      ])

      # Write Random Value
      self.write_to_reg(addr, test_data)
      reg_value = '{0:0>4x}'.format(int(self.read_from_reg(addr), 2))

      wdata_rand.extend([
        "  // Write random value to 0x%s\n" % addr_hex,
        "  REQ(%s%s)\n" % (write_hex, test_data_hex),
        "  WAIT\n",
        "  ASSERT(%s0000, \"0x%s WRandVE!\\n\")\n\n" % (write_hex, addr_hex),
        # "  print_str(\"TEST Write PASSED: %s\\n\");" % addr_hex,
        "  // Read value from 0x%s\n" % addr_hex,
        "  REQ(%s0000)\n" % read_hex,
        "  WAIT\n",
        "  ASSERT(0x0%s%s, \"0x%s RRandVE!\\n\")\n\n" % (addr_hex, reg_value, addr_hex),
        # "  print_str(\"TEST Read PASSED: %s\\n\");" % addr_hex,
      ])

      # Write Invert Random Value
      self.write_to_reg(addr, invert_data)
      reg_value = '{0:0>4x}'.format(int(self.read_from_reg(addr), 2))

      wdata_rand_invert.extend([
        "  // Write Invert value to 0x%s\n" % addr_hex,
        "  REQ(%s%s)\n" % (write_hex, invert_data_hex),
        "  WAIT\n",
        "  ASSERT(%s0000, \"0x%s WInvVE!\\n\")\n\n" % (write_hex, addr_hex),
        "  // Read value from 0x%s\n" % addr_hex,
        "  REQ(%s0000)\n" % read_hex,
        "  WAIT\n",
        "  ASSERT(0x0%s%s, \"0x%s RInvVE!\\n\")\n\n" % (addr_hex, reg_value, addr_hex),
      ])

    for line in template:
      if "{%" in line:
        if "{% Check Default Value %}" in line:
          contents.extend(default_value)
        elif "{% Write Testcase %}" in line:
          contents.extend(wdata_rand)
        elif "{% Write Invert Testcase %}" in line:
          contents.extend(wdata_rand_invert)
        else:
          print "WARNNING!"
          print line
      else:
        contents.append(line)

    self.regfile_dict = copy.deepcopy(orig_rf_dict)

    return contents

  def genCommon(self, config):
    if self.handle_regfile_config(config):
      # Generate Common Blocks
      self.gen_regfile_ana_connection()

  def gen_report(self):
    contents = []
    contents.extend([
      "Report:\n",
      "  Total filed: %d\n" % (self.ana_total + self.dig_total),
      "    Digital: %d\n" % self.dig_total,
      "    Analog:  %d\n" % self.ana_total,
      "  Total bits: %d\n" % (self.ana_bits_total + self.dig_bits_total),
      "    Digital: %d\n" % self.dig_bits_total,
      "    Analog:  %d\n" % self.ana_bits_total,
    ])

    return contents

  def genTB(self, template):
    # Write testbench
    orig_rf_dict = {}
    orig_rf_dict = copy.deepcopy(self.regfile_dict)
    testbench = []
    for line in template:
      if "{%" in line:
        if "{% Analog Registers IO Declaration %}" in line:
          testbench.extend(self.gen_analog_io_declaration())
        elif "{% RegFile Analog IO %}" in line:
          testbench.append("  // Analog IO\n")
          testbench.extend(self.regfile_dut)
        elif "{% Dummy Analog IO %}" in line:
          testbench.extend(self.dummy_ana_block)
        elif "{% Test Case %}" in line:
          testbench.extend(self.gen_testcase_init())
          testbench.extend(self.gen_assert_reset())
          testbench.extend(self.gen_testcase_write_to_ana())
          testbench.extend(self.gen_testcase_read_from_ana())
          testbench.extend([
            "    # (STEP * 10) begin\n",
            "      $finish;\n",
            "    end\n",
            "  end\n",
            "\n",
          ])
        else:
          print "WARNNING!"
          print line
      else:
        testbench.append(line)

    self.regfile_dict = copy.deepcopy(orig_rf_dict)
    return testbench

