regfile_config = {
  "regs": {
    "io_send_done": {
      "addr":   0x2,
      "msb":    12,
      "lsb":    12,
      "access": "RD",
      "init":   0x0,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_send_mode": {
      "addr":   0x2,
      "msb":    13,
      "lsb":    13,
      "access": "WR",
      "init":   0x1,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_send_count_hign": {
      "addr":   0x4,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x0,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_suspend": {
      "addr":   0x2,
      "msb":    14,
      "lsb":    14,
      "access": "WR",
      "init":   0x0,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_send_count_low": {
      "addr":   0x3,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x100,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_etype": {
      "addr":   0xd,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x8800,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_pkt_len_mode": {
      "addr":   0x2,
      "msb":    11,
      "lsb":    11,
      "access": "WR",
      "init":   0x1,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "CHIP_VER": {
      "addr":   0x1,
      "msb":    15,
      "lsb":    0,
      "access": "RD",
      "init":   0xbeef,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_da_h": {
      "addr":   0x9,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0xaabb,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_da_l": {
      "addr":   0x7,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0xeeff,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_payload_mode": {
      "addr":   0x2,
      "msb":    10,
      "lsb":    9,
      "access": "WR",
      "init":   0x2,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_da_m": {
      "addr":   0x8,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0xccdd,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_total_send_count_l": {
      "addr":   0xf,
      "msb":    15,
      "lsb":    0,
      "access": "RD",
      "init":   0x0,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_total_send_count_m": {
      "addr":   0x10,
      "msb":    15,
      "lsb":    0,
      "access": "RD",
      "init":   0x0,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_total_send_count_h": {
      "addr":   0x11,
      "msb":    15,
      "lsb":    0,
      "access": "RD",
      "init":   0x0,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_sa_h": {
      "addr":   0xc,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x11,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_sa_m": {
      "addr":   0xb,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x2233,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_sa_l": {
      "addr":   0xa,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x4455,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "reset": {
      "addr":   0x2,
      "msb":    8,
      "lsb":    8,
      "access": "WR",
      "init":   0x0,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_inter_frame_gap": {
      "addr":   0x6,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x12,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_total_send_count_clr": {
      "addr":   0x2,
      "msb":    7,
      "lsb":    7,
      "access": "WR",
      "init":   0x0,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_pkt_len_init": {
      "addr":   0x5,
      "msb":    15,
      "lsb":    0,
      "access": "WR",
      "init":   0x64,
      "desc":   "Addr[15:0]",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
    "io_enable": {
      "addr":   0x2,
      "msb":    15,
      "lsb":    15,
      "access": "WR",
      "init":   0x1,
      "desc":   "",
      "dest":   "Digital",
      "region":   "N/A",
      "location":   "N/A",
    },
  },
  "addrs": {
    0x1: {
      "desc": "Chip Version"
      "regs": [
        "CHIP_VER",
      ],
    },
    0x2: {
      "desc": "Control"
      "regs": [
        "io_enable",
        "io_suspend",
        "io_send_mode",
        "io_send_done",
        "io_pkt_len_mode",
        "io_payload_mode",
        "reset",
        "io_total_send_count_clr",
      ],
    },
    0x3: {
      "desc": "io_send_count"
      "regs": [
        "io_send_count_low",
      ],
    },
    0x4: {
      "desc": "io_send_count_2"
      "regs": [
        "io_send_count_hign",
      ],
    },
    0x5: {
      "desc": "io_pkt_len_init"
      "regs": [
        "io_pkt_len_init",
      ],
    },
    0x6: {
      "desc": "io_inter_frame_gap"
      "regs": [
        "io_inter_frame_gap",
      ],
    },
    0x7: {
      "desc": "io_da_l"
      "regs": [
        "io_da_l",
      ],
    },
    0x8: {
      "desc": "io_da_m"
      "regs": [
        "io_da_m",
      ],
    },
    0x9: {
      "desc": "io_da_h"
      "regs": [
        "io_da_h",
      ],
    },
    0xa: {
      "desc": "io_sa_l"
      "regs": [
        "io_sa_l",
      ],
    },
    0xb: {
      "desc": "io_sa_m"
      "regs": [
        "io_sa_m",
      ],
    },
    0xc: {
      "desc": "io_sa_h"
      "regs": [
        "io_sa_h",
      ],
    },
    0xd: {
      "desc": "io_etype"
      "regs": [
        "io_etype",
      ],
    },
    0xf: {
      "desc": "io_total_send_count_l"
      "regs": [
        "io_total_send_count_l",
      ],
    },
    0x10: {
      "desc": "io_total_send_count_m"
      "regs": [
        "io_total_send_count_m",
      ],
    },
    0x11: {
      "desc": "io_total_send_count_h"
      "regs": [
        "io_total_send_count_h",
      ],
    },
  },
}

