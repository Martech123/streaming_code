import sys
import re
import csv

class Parser:
  def __init__(self):
    pass

  def isNotEmptyLine(self, line):
    return any(item.strip() != '' for item in line)

  def readCSV(self, doc_file):
    regFileBlocks = []
    block = []
    with open(doc_file, 'rb') as csvfile:
      doc_reader = csv.reader(csvfile)
      for row in doc_reader:
        if self.isNotEmptyLine(row):
          block.append(row)
        else:
          if block:
            regFileBlocks.append(block)
            block = []

    if block:
      regFileBlocks.append(block)

    return regFileBlocks

  def parseFieldLine(self, addr, line, has_existed_lsb):
    access_list = ['RW', 'RD', 'WR', 'CONST']
    access      = line[3]
    init        = line[2]
    dest        = line[5]
    desc        = line[6].replace("\n", "; ")
    region      = line[8]
    loc         = line[9]

    msb_lsb = map(int, line[1][1:-1].split(":"))
    if len(msb_lsb) == 1:
      msb = msb_lsb[0]
      lsb = msb_lsb[0]
    else:
      msb, lsb = msb_lsb

    # Field Validation
    if access.upper() in access_list:
      access = access.upper()
    else:
      print "ERROR: R/W Property must be 'RW/RD/WR'!"
      print line
      print access
      sys.exit(-1)

    if msb >= has_existed_lsb:
      print "ERROR: 0x%x has overlapped!" % addr
      print line
      print msb, has_existed_lsb
      sys.exit(-1)
    elif msb < lsb:
      print "ERROR: Should be [msb:lsb]"
      print line
      print "msb %d, lsb %d" % (msb, lsb)
      sys.exit(-1)

    if init == '':
        print "WARNNING: Empty Default Value!"
        print line
        sys.exit(-1)
    else:
        init = int(init, 16)
        if init >= (2 ** (msb-lsb+1)):
          print "ERROR: %d bits Width: %d too small can't contain: %d" % (msb-lsb+1, (2 ** (msb-lsb+1)), init)
          print line
          sys.exit(-1)

    # Add filed to config_format
    field_info = dict()

    field_info["addr"] = addr
    field_info["msb"] = msb
    field_info["lsb"] = lsb
    field_info["access"] = access
    field_info["init"] = init
    field_info["desc"] = desc
    field_info["dest"] = dest
    if dest.lower() == "analog":
      if len(region.split()) == 0 or len(loc.split()) == 0:
        print line
        print "ERROR: Region or Location is Empty!"
        sys.exit(-1)
      else:
        field_info["region"] = region
        field_info["location"] = int(loc)
    else:
      field_info["region"] = "N/A"
      field_info["location"] = "N/A"

    return (field_info, lsb)

  def genConfig(self, doc_file):
    """
    "regs": {
      "NAME":
        {
          "addr":   ADDRESS,
          "msb":    MSB,
          "lsb":    LSB,
          "access": "RW/RD/WR",
          "init":   INIT VALUE,
          "desc":   "DESC",
          "dest":   "DEST",
        },
      ...
    },
    "addrs": {
      "addr": {
        "desc": String,
        "regs": List,
      },
    }
    "regs": {
    """
    rfconfig   = dict()
    regs_dict  = dict()
    addrs_dict = dict()

    all_regfield_list = []

    for idx, block in enumerate(self.readCSV(doc_file)):
      block_desc = ""
      block_addr = idx
      block_regs = []
      parsed_lsb = 16

      for field in block:
        # 1. Register File Entry Description
        if '#' in field[0]:
          block_desc = field[1]
        # 2. Register File Address (if specify)
        elif "# addr=" in field[1]:
          block_addr = int(field[1].split("=")[1], 16)
        # 3. Parse Field Line
        elif field[3].upper() != "RSVD":
          field_name = field[4].strip()
	  if field_name in all_regfield_list:
	    print "ERROR: %s ALREADY EXIST!" % field_name
	    sys.exit(-1) 
          block_regs.append(field_name)
	  all_regfield_list.append(field_name)
          regs_dict[field_name], parsed_lsb = self.parseFieldLine(block_addr, field, parsed_lsb)
        elif field[3].upper() == "RSVD":
          continue
          print "WARNNING: Ingore RSVD Field!"
          print field
        else:
          print "ERROR: Line Invalid!"
          print field
          sys.exit(-1)

      if block_addr in addrs_dict:
        print "ERROR: Addr already exist!"
        print block
        sys.exit(-1)

      if block_regs != []:
        addrs_dict[block_addr] = dict()
        addrs_dict[block_addr]["desc"] = block_desc
        addrs_dict[block_addr]["regs"] = block_regs

    rfconfig["regs"]  = regs_dict
    rfconfig["addrs"] = addrs_dict

    return rfconfig

  def getAllFieldsContents(self, field):
    contents = []
    contents.extend([
      '      "addr":   %s,\n' % hex(field["addr"]),
      '      "msb":    %d,\n' % field["msb"],
      '      "lsb":    %d,\n' % field["lsb"],
      '      "access": "%s",\n' % field["access"],
      '      "init":   %s,\n' % hex(field["init"]),
      '      "desc":   "%s",\n' % field["desc"],
      '      "dest":   "%s",\n' % field["dest"],
      '      "region":   "%s",\n' % field["region"],
      '      "location":   "%s",\n' % field["location"],
      '    },\n',
    ])

    return contents

  def dump_config(self, config):
    contents = []
    contents.extend([
      'regfile_config = {\n',
      '  "regs": {\n',
    ])

    for key, val in config["regs"].items():
        contents.append('    "%s": {\n' % key)
        contents.extend(self.getAllFieldsContents(val))

    contents.extend([
        '  },\n',
    ])

    contents.extend([
        '  "addrs": {\n',
    ])


    sorted_addrs = sorted(config["addrs"].keys())
    for addr in sorted_addrs:
      contents.append('    0x%x: {\n' % addr)
      contents.append('      "desc": "%s"\n' % config["addrs"][addr]["desc"])
      contents.append('      "regs": [\n')
      for name in config["addrs"][addr]["regs"]:
        contents.append('        "%s",\n' % name)
      contents.append('      ],\n')
      contents.append('    },\n')

    contents.extend([
      '  },\n',
      '}\n',
      '\n',
    ])

    return contents
