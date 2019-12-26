package eth_pkg

import scala.math.{pow, log, ceil}
import util.Random
import chisel3._
import chisel3.util._
import chisel3.core.dontTouch
import scala.collection.mutable.ArrayBuffer
import scala.util.control._
import LocalFunction._

/* pkt generator; when enable pkt generator will fetch
 * meta info and genetate pkt to interface, the tx_counter
 * will incr 1, if disabled pkt will stop after current pkt send done
 */
class PktGen8bit extends Module {
  val io = IO(new Bundle {
    val enable                = Input (Bool())
    val suspend               = Input (Bool())

    /* 1: contineous 0: fixed count of pkts */
    val send_mode             = Input (Bool())
    val send_count            = Input (UInt(32.W))
    val send_done             = Output(Bool())

    /* 0: fixed len 1: random */
    val pkt_len_mode          = Input (Bool())
    val pkt_len_init          = Input (UInt(16.W))

    /* set IPG */
    val inter_frame_gap       = Input (UInt(16.W))

    /* 0: 5a, mode 1: incr byte, mode 2: incr, mode 3: random */
    val payload_mode          = Input (UInt(2.W))
    val da                    = Input (UInt(48.W))
    val sa                    = Input (UInt(48.W))
    val etype                 = Input (UInt(16.W))

    val tx_en                 = Output(Bool())
    val tx_data               = Output(UInt(8.W))

    val total_send_count_clr  = Input (Bool())
    val total_send_count      = Output(UInt(48.W))
  })

  io <> DontCare

  val sIdle :: sIPG :: sPreamble_1 :: sPreamble_2 :: sEType :: sDA :: sSA :: sPayload :: sCRC :: Nil = Enum(9)
  val state = RegInit(sIdle)
  val eth_fcs_padding = Module (new EthFcsPadding)

  val tx_en                  = RegInit(false.B)
  val tx_data                = RegInit(0.U(8.W))

  val cntr                   = RegInit(0.U(16.W))
  val pkt_len                = RegInit(0.U(16.W))
  val total_send_count       = RegInit(0.U(48.W))
  val send_count             = RegInit(0.U(48.W))
  val send_done              = RegInit(false.B)

  val loaded_pkt_len         = RegInit(0.U(16.W))

  // tx pkt counter stats
  when (risingedge(io.enable)) {
    send_count := 0.U
  } .elsewhen (fallingedge(io.tx_en)) {
    send_count := send_count + 1.U
  }

  when (risingedge(io.enable)) {
    send_done := false.B
  } .otherwise {
    when (io.send_mode === 0.U) {
      send_done := send_count === io.send_count
    }
  }

  when (io.total_send_count_clr) {
    total_send_count := 0.U
  } .elsewhen (fallingedge(io.tx_en)) {
    total_send_count := total_send_count + 1.U
  }

  /* pkt_len_init should in range [min, max] when pkt_len_mode =/= 0.U */
  /* this should be checked by user */
  when (risingedge(io.enable)) {
    loaded_pkt_len         := io.pkt_len_init
  }

  val load_r = RegInit(0.U(48.W))

  switch(state) {
    is (sIdle) {
      cntr := 0.U
      when (!io.suspend && RegNext(io.enable) && !send_done) {
        state := sPreamble_1
        tx_en := true.B
        tx_data := 0x55.U
        when (io.pkt_len_mode === 0.U) {
          // fixed
          pkt_len := loaded_pkt_len
        } .elsewhen (io.pkt_len_mode === 1.U) {
          // random: pkt_len range is [io.pkt_len_min, io.pkt_len_max]
          pkt_len := (LFSR16() % ((64.U - 1518.U) + 1.U)) + 64.U
        }
      } .otherwise {
        tx_en := false.B
        tx_data := 0.U
      }
    }
    is (sPreamble_1) {
      when (cntr === (7 - 1).U) {
        state := sPreamble_2
        tx_data := 0xD5.U
      } .otherwise {
        cntr := cntr + 1.U
      }
    }
    is (sPreamble_2) {
      state := sDA
      cntr := 0.U
      tx_data := io.da(47, 40)
      load_r := io.da << 8
    }
    is (sDA) {
      when (cntr === (6 - 1).U) {
        state := sSA
        tx_data := io.sa(47, 40)
        load_r := io.sa << 8
        cntr := 0.U
      } .otherwise {
        tx_data := load_r(47, 40)
        load_r := load_r << 8
        cntr := cntr + 1.U
      }
    }
    is (sSA) {
      when (cntr === (6 - 1).U) {
        state := sEType
        tx_data := io.etype(15, 8)
        cntr := 0.U
      } .otherwise {
        tx_data := load_r(47, 40)
        load_r := load_r << 8
        cntr := cntr + 1.U
      }
    }
    is (sEType) {
      when (cntr === (2 - 1).U) {
        state := sPayload
        when (io.payload_mode === 0.U) {
          tx_data := 0x5a.U
        } .elsewhen (io.payload_mode === 1.U) {
          tx_data := 0.U
        } .elsewhen (io.payload_mode === 2.U) {
          tx_data := LFSR16()
        } .elsewhen (io.payload_mode === 3.U) {
          tx_data := 0.U
        }
        cntr := 0.U
      } .otherwise {
        tx_data := io.etype(7, 0)
        cntr := cntr + 1.U
      }
    }
    is (sPayload) {// calc crc
      when (cntr === pkt_len - 12.U /* da sa */ - 2.U /* etype */ - 4.U /* crc */ - 1.U) {
        state := sCRC
        cntr := 0.U
        tx_data := 0xab.U /* dummy */
      } .otherwise {
        /* 0: 5a, mode 1: incr byte, mode 2: incr, mode 3: random */
        when (io.payload_mode === 0.U) {
          tx_data := 0x5a.U
        } .elsewhen (io.payload_mode === 1.U) {
          tx_data := tx_data + 1.U
        } .elsewhen (io.payload_mode === 2.U) {
          tx_data := LFSR16()
        } .elsewhen (io.payload_mode === 3.U) {
          tx_data := tx_data + 8.U
        }
        cntr := cntr + 1.U
      }
    }
    is (sCRC) {
      when (cntr === (4 - 1).U) {
        state := sIPG
        tx_en := false.B
        tx_data := 0.U
        cntr := 0.U
      } .otherwise {
        cntr := cntr + 1.U
        tx_data := tx_data + 1.U /* dummy */
      }
    }
    is (sIPG) {
      when (cntr === io.inter_frame_gap - 1.U - 1.U) {
        state := sIdle
      } .otherwise {
        cntr := cntr + 1.U
      }
    }
  }

  eth_fcs_padding.io.rx_en  := tx_en
  eth_fcs_padding.io.rx_dat := tx_data

  io.send_done := send_done

  io.tx_en   := eth_fcs_padding.io.tx_en
  io.tx_data := eth_fcs_padding.io.tx_dat

  io.total_send_count := total_send_count
}


class PktGen4bit extends Module {
  val io = IO(new Bundle {
    val enable                = Input (Bool())
    val suspend               = Input (Bool())

    /* 1: contineous 0: fixed count of pkts */
    val send_mode             = Input (Bool())
    val send_count            = Input (UInt(32.W))
    val send_done             = Output(Bool())

    /* 0: fixed len 1: random */
    val pkt_len_mode          = Input (Bool())
    val pkt_len_init          = Input (UInt(16.W))

    /* set IPG */
    val inter_frame_gap       = Input (UInt(16.W))

    /* 0: 5a, mode 1: incr byte, mode 2: incr, mode 3: random */
    val payload_mode          = Input (UInt(2.W))
    val da                    = Input (UInt(48.W))
    val sa                    = Input (UInt(48.W))
    val etype                 = Input (UInt(16.W))

    val tx_en                 = Output(Bool())
    val tx_data               = Output(UInt(4.W))

    val total_send_count_clr  = Input (Bool())
    val total_send_count      = Output(UInt(48.W))
  })

  io <> DontCare

  val sIdle :: sIPG :: sPreamble_1 :: sPreamble_2 :: sEType :: sDA :: sSA :: sPayload :: sCRC :: Nil = Enum(9)
  val state = RegInit(sIdle)
  val eth_fcs_padding = Module (new EthFcsPadding_4bit)

  val tx_en                  = RegInit(false.B)
  val tx_data                = RegInit(0.U(4.W))

  val cntr                   = RegInit(0.U(16.W))
  val pkt_len                = RegInit(0.U(16.W))
  val total_send_count       = RegInit(0.U(48.W))
  val send_count             = RegInit(0.U(48.W))
  val send_done              = RegInit(false.B)

  val loaded_pkt_len         = RegInit(0.U(16.W))

  // tx pkt counter stats
  when (risingedge(io.enable)) {
    send_count := 0.U
  } .elsewhen (fallingedge(io.tx_en) && (!send_done)) {
    send_count := send_count + 1.U
  }

  when (risingedge(io.enable)) {
    send_done := false.B
  } .otherwise {
    when (io.send_mode === 0.U) {
      send_done := send_count === io.send_count
    }
  }

  when (io.total_send_count_clr) {
    total_send_count := 0.U
  } .elsewhen (fallingedge(io.tx_en)) {
    total_send_count := total_send_count + 1.U
  }

  /* pkt_len_init should in range [min, max] when pkt_len_mode =/= 0.U */
  /* this should be checked by user */
  when (risingedge(io.enable)) {
    loaded_pkt_len         := io.pkt_len_init
  }

  val load_r = RegInit(0.U(48.W))

  switch(state) {
    is (sIdle) {
      cntr := 0.U
      when (!io.suspend && RegNext(io.enable) && !send_done) {
        state := sPreamble_1
        tx_en := true.B
        tx_data := 0x5.U
        when (io.pkt_len_mode === 0.U) {
          // fixed
          pkt_len := loaded_pkt_len
        } .elsewhen (io.pkt_len_mode === 1.U) {
          // random: pkt_len range is [io.pkt_len_min, io.pkt_len_max]
          pkt_len := (LFSR16() % ((64.U - 1518.U) + 1.U)) + 64.U
        }
      } .otherwise {
        tx_en := false.B
        tx_data := 0.U
      }
    }
    is (sPreamble_1) {
      when (cntr === (15 - 1).U) {
        state := sPreamble_2
        tx_data := 0xD.U
      } .otherwise {
        cntr := cntr + 1.U
      }
    }
    is (sPreamble_2) {
      state := sDA
      cntr := 0.U
      tx_data := io.da(47, 44)
      load_r := io.da << 4
    }
    is (sDA) {
      when (cntr === (12 - 1).U) {
        state := sSA
        tx_data := io.sa(47, 44)
        load_r := io.sa << 4
        cntr := 0.U
      } .otherwise {
        tx_data := load_r(47, 44)
        load_r := load_r << 4
        cntr := cntr + 1.U
      }
    }
    is (sSA) {
      when (cntr === (12 - 1).U) {
        state := sEType
        tx_data := io.etype(15, 12)
	load_r := io.etype << 4
        cntr := 0.U
      } .otherwise {
        tx_data := load_r(47, 44)
        load_r := load_r << 4
        cntr := cntr + 1.U
      }
    }
    is (sEType) {
      when (cntr === (4 - 1).U) {
        state := sPayload
        when (io.payload_mode === 0.U) {
          tx_data := 0x0.U
        } .elsewhen (io.payload_mode === 1.U) {
          tx_data := 0.U
        } .elsewhen (io.payload_mode === 2.U) {
          tx_data := LFSR16()
        } .elsewhen (io.payload_mode === 3.U) {
          tx_data := 0.U
        }
        cntr := 0.U
      } .otherwise {
        tx_data := load_r(15, 12)
        load_r := load_r << 4
        cntr := cntr + 1.U
      }
    }
    is (sPayload) {// calc crc
      when (cntr === pkt_len - 24.U /* da sa */ - 4.U /* etype */ - 8.U /* crc */ - 1.U) {
        state := sCRC
        cntr := 0.U
        tx_data := 0xd.U /* dummy */
      } .otherwise {
        /* 0: 5a, mode 1: incr byte, mode 2: incr, mode 3: random */
        when (io.payload_mode === 0.U) {
          tx_data := 0x0.U
        } .elsewhen (io.payload_mode === 1.U) {
          tx_data := tx_data + 1.U
        } .elsewhen (io.payload_mode === 2.U) {
          tx_data := LFSR16()
        } .elsewhen (io.payload_mode === 3.U) {
          tx_data := tx_data + 4.U
        }
        cntr := cntr + 1.U
      }
    }
    is (sCRC) {
      when (cntr === (8 - 1).U) {
        state := sIPG
        tx_en := false.B
        tx_data := 0.U
        cntr := 0.U
      } .otherwise {
        cntr := cntr + 1.U
        tx_data := tx_data  /* dummy d */
      }
    }
    is (sIPG) {
      when (cntr === io.inter_frame_gap - 1.U - 1.U) {
        state := sIdle
      } .otherwise {
        cntr := cntr + 1.U
      }
    }
  }

  eth_fcs_padding.io.rx_en  := tx_en
  eth_fcs_padding.io.rx_dat := tx_data

  io.send_done := send_done

  io.tx_en   := eth_fcs_padding.io.tx_en
  io.tx_data := eth_fcs_padding.io.tx_dat

  io.total_send_count := total_send_count
}
