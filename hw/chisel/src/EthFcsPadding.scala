package eth_pkg

import scala.math.{pow, log, ceil}
import util.Random
import chisel3._
import chisel3.util._
import chisel3.core.dontTouch
import scala.collection.mutable.ArrayBuffer
import scala.util.control._
import LocalFunction._

class EthCRC32 extends Module {
  val io = IO (new Bundle {
    val data   =  Input (UInt(8.W))
    val enable =  Input (Bool())
    val start  =  Input (Bool())
    val crc    =  Output(UInt(32.W))
  })

  // polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  // data width: 8
  // convention: the first serial bit is D[7]
  
  val c = RegInit("hffff_ffff".U(32.W))
  val d = WireInit(0.U(8.W))
  val newcrc = WireInit(VecInit(Seq.fill(32)(0.U(1.W))))

  d := Cat(io.data(0), io.data(1), io.data(2),io.data(3),io.data(4),io.data(5),io.data(6),io.data(7))

  newcrc(0)  := d(6) ^ d(0) ^ c(24) ^ c(30);
  newcrc(1)  := d(7) ^ d(6) ^ d(1) ^ d(0) ^ c(24) ^ c(25) ^ c(30) ^ c(31);
  newcrc(2)  := d(7) ^ d(6) ^ d(2) ^ d(1) ^ d(0) ^ c(24) ^ c(25) ^ c(26) ^ c(30) ^ c(31);
  newcrc(3)  := d(7) ^ d(3) ^ d(2) ^ d(1) ^ c(25) ^ c(26) ^ c(27) ^ c(31);
  newcrc(4)  := d(6) ^ d(4) ^ d(3) ^ d(2) ^ d(0) ^ c(24) ^ c(26) ^ c(27) ^ c(28) ^ c(30);
  newcrc(5)  := d(7) ^ d(6) ^ d(5) ^ d(4) ^ d(3) ^ d(1) ^ d(0) ^ c(24) ^ c(25) ^ c(27) ^ c(28) ^ c(29) ^ c(30) ^ c(31);
  newcrc(6)  := d(7) ^ d(6) ^ d(5) ^ d(4) ^ d(2) ^ d(1) ^ c(25) ^ c(26) ^ c(28) ^ c(29) ^ c(30) ^ c(31);
  newcrc(7)  := d(7) ^ d(5) ^ d(3) ^ d(2) ^ d(0) ^ c(24) ^ c(26) ^ c(27) ^ c(29) ^ c(31);
  newcrc(8)  := d(4) ^ d(3) ^ d(1) ^ d(0) ^ c(0) ^ c(24) ^ c(25) ^ c(27) ^ c(28);
  newcrc(9)  := d(5) ^ d(4) ^ d(2) ^ d(1) ^ c(1) ^ c(25) ^ c(26) ^ c(28) ^ c(29);
  newcrc(10) := d(5) ^ d(3) ^ d(2) ^ d(0) ^ c(2) ^ c(24) ^ c(26) ^ c(27) ^ c(29);
  newcrc(11) := d(4) ^ d(3) ^ d(1) ^ d(0) ^ c(3) ^ c(24) ^ c(25) ^ c(27) ^ c(28);
  newcrc(12) := d(6) ^ d(5) ^ d(4) ^ d(2) ^ d(1) ^ d(0) ^ c(4) ^ c(24) ^ c(25) ^ c(26) ^ c(28) ^ c(29) ^ c(30);
  newcrc(13) := d(7) ^ d(6) ^ d(5) ^ d(3) ^ d(2) ^ d(1) ^ c(5) ^ c(25) ^ c(26) ^ c(27) ^ c(29) ^ c(30) ^ c(31);
  newcrc(14) := d(7) ^ d(6) ^ d(4) ^ d(3) ^ d(2) ^ c(6) ^ c(26) ^ c(27) ^ c(28) ^ c(30) ^ c(31);
  newcrc(15) := d(7) ^ d(5) ^ d(4) ^ d(3) ^ c(7) ^ c(27) ^ c(28) ^ c(29) ^ c(31);
  newcrc(16) := d(5) ^ d(4) ^ d(0) ^ c(8) ^ c(24) ^ c(28) ^ c(29);
  newcrc(17) := d(6) ^ d(5) ^ d(1) ^ c(9) ^ c(25) ^ c(29) ^ c(30);
  newcrc(18) := d(7) ^ d(6) ^ d(2) ^ c(10) ^ c(26) ^ c(30) ^ c(31);
  newcrc(19) := d(7) ^ d(3) ^ c(11) ^ c(27) ^ c(31);
  newcrc(20) := d(4) ^ c(12) ^ c(28);
  newcrc(21) := d(5) ^ c(13) ^ c(29);
  newcrc(22) := d(0) ^ c(14) ^ c(24);
  newcrc(23) := d(6) ^ d(1) ^ d(0) ^ c(15) ^ c(24) ^ c(25) ^ c(30);
  newcrc(24) := d(7) ^ d(2) ^ d(1) ^ c(16) ^ c(25) ^ c(26) ^ c(31);
  newcrc(25) := d(3) ^ d(2) ^ c(17) ^ c(26) ^ c(27);
  newcrc(26) := d(6) ^ d(4) ^ d(3) ^ d(0) ^ c(18) ^ c(24) ^ c(27) ^ c(28) ^ c(30);
  newcrc(27) := d(7) ^ d(5) ^ d(4) ^ d(1) ^ c(19) ^ c(25) ^ c(28) ^ c(29) ^ c(31);
  newcrc(28) := d(6) ^ d(5) ^ d(2) ^ c(20) ^ c(26) ^ c(29) ^ c(30);
  newcrc(29) := d(7) ^ d(6) ^ d(3) ^ c(21) ^ c(27) ^ c(30) ^ c(31);
  newcrc(30) := d(7) ^ d(4) ^ c(22) ^ c(28) ^ c(31);
  newcrc(31) := d(5) ^ c(23) ^ c(29);

  when (!io.start) {
    c := "hffff_ffff".U
  } .elsewhen (io.enable) {
    c := newcrc.asTypeOf(UInt(32.W))
  } .otherwise {
    c := c
  }

  val crc_r = WireInit(0.U(32.W))
  crc_r := ~c

  io.crc := Cat(crc_r(0) ,crc_r(1) ,crc_r(2) ,crc_r(3) ,crc_r(4) ,crc_r(5) ,crc_r(6) ,crc_r(7) ,
                crc_r(8) ,crc_r(9) ,crc_r(10),crc_r(11),crc_r(12),crc_r(13),crc_r(14),crc_r(15),
                crc_r(16),crc_r(17),crc_r(18),crc_r(19),crc_r(20),crc_r(21),crc_r(22),crc_r(23),
                crc_r(24),crc_r(25),crc_r(26),crc_r(27),crc_r(28),crc_r(29),crc_r(30),crc_r(31))

}

class EthFcsPadding extends Module {
  val io = IO (new Bundle {
    val rx_en  = Input (Bool())
    val rx_dat = Input (UInt(8.W))
    val tx_en  = Output(Bool())
    val tx_dat = Output(UInt(8.W))
  })

  val crc32_d8 = Module (new EthCRC32)

  val sIdle :: sPreamble :: sDATA :: sCRC1 :: sCRC2 :: Nil = Enum(5)
  val state   = RegInit(sIdle)

  val counter     = RegInit(0.U(8.W))
  val crc_enable  = RegInit(false.B)
  val crc_out     = WireInit(0.U(32.W))
  val crc_out_r   = RegInit(0.U(32.W))
  val tx_en       = RegInit(false.B)
  val tx_dat      = RegInit(0.U(8.W))

  val rx_valid_r5 = ShiftRegister(io.rx_en,  5)
  val rx_data_r5  = ShiftRegister(io.rx_dat, 5)

  switch (state) {
    is (sIdle) {
      counter := 0.U
      crc_enable := false.B
      when (risingedge(rx_valid_r5)) {
        when (rx_data_r5 === 0x55.U) {
          state := sPreamble
          tx_en := true.B
          tx_dat := rx_data_r5
        }
      } .otherwise {
        tx_en := false.B
        tx_dat := 0.U
      }
    }
    is (sPreamble) {
      tx_dat := rx_data_r5
      counter := counter + 1.U
      when (counter === (8 - 1).U) {
        // if do not find 0xD5; go back to sIdle
        state := sIdle
      } .elsewhen (rx_data_r5 === 0xD5.U) {
        state := sDATA
        counter := 0.U
        crc_enable := true.B
      }
    }
    is (sDATA) {
      tx_dat := rx_data_r5
      when (!io.rx_en) {
        state := sCRC1
        counter := 0.U
        crc_enable := false.B
      }
    }
    is (sCRC1) {
      state := sCRC2
      crc_out_r := crc_out >> 8
      tx_dat := crc_out(7, 0)
      counter := counter + 1.U
    }
    is (sCRC2) {
      crc_out_r := crc_out_r >> 8
      counter := counter + 1.U
      when (counter === 4.U) {
        state := sIdle
        tx_en := false.B
        tx_dat := 0.U
      } .otherwise {
        tx_dat := crc_out_r(7, 0)
      }
    }
  }

  crc32_d8.io.data   <> rx_data_r5
  crc32_d8.io.enable <> crc_enable
  crc32_d8.io.start  <> crc_enable
  crc32_d8.io.crc    <> crc_out

  io.tx_en  := tx_en
  io.tx_dat := tx_dat
}

class EthCRC32_4bit extends Module {
  val io = IO (new Bundle {
    val data   =  Input (UInt(4.W))
    val enable =  Input (Bool())
    val start  =  Input (Bool())
    val crc    =  Output(UInt(32.W))
  })

  // polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  // data width: 4
  // convention: the first serial bit is D[3]

  val c = RegInit("hffff_ffff".U(32.W))
  val d = WireInit(0.U(4.W))
  val newcrc = WireInit(VecInit(Seq.fill(32)(0.U(1.W))))

  d := Cat(io.data(0), io.data(1), io.data(2),io.data(3))

  newcrc(0)  := d(0) ^ c(28);
  newcrc(1)  := d(1) ^ d(0)  ^ c(28) ^ c(29);
  newcrc(2)  := d(2) ^ d(1)  ^ d(0)  ^ c(28) ^ c(29) ^ c(30);
  newcrc(3)  := d(3) ^ d(2)  ^ d(1)  ^ c(29) ^ c(30) ^ c(31);
  newcrc(4)  := d(3) ^ d(2)  ^ d(0)  ^ c(0)  ^ c(28) ^ c(30) ^ c(31);
  newcrc(5)  := d(3) ^ d(1)  ^ d(0)  ^ c(1)  ^ c(28) ^ c(29) ^ c(31);
  newcrc(6)  := d(2) ^ d(1)  ^ c(2)  ^ c(29) ^ c(30);
  newcrc(7)  := d(3) ^ d(2)  ^ d(0)  ^ c(3)  ^ c(28) ^ c(30) ^ c(31);
  newcrc(8)  := d(3) ^ d(1)  ^ d(0)  ^ c(4)  ^ c(28) ^ c(29) ^ c(31);
  newcrc(9)  := d(2) ^ d(1)  ^ c(5)  ^ c(29) ^ c(30);
  newcrc(10) := d(3) ^ d(2)  ^ d(0)  ^ c(6)  ^ c(28) ^ c(30) ^ c(31);
  newcrc(11) := d(3) ^ d(1)  ^ d(0)  ^ c(7)  ^ c(28) ^ c(29) ^ c(31);
  newcrc(12) := d(2) ^ d(1)  ^ d(0)  ^ c(8)  ^ c(28) ^ c(29) ^ c(30);
  newcrc(13) := d(3) ^ d(2)  ^ d(1)  ^ c(9)  ^ c(29) ^ c(30) ^ c(31);
  newcrc(14) := d(3) ^ d(2)  ^ c(10) ^ c(30) ^ c(31);
  newcrc(15) := d(3) ^ c(11) ^ c(31);
  newcrc(16) := d(0) ^ c(12) ^ c(28);
  newcrc(17) := d(1) ^ c(13) ^ c(29);
  newcrc(18) := d(2) ^ c(14) ^ c(30);
  newcrc(19) := d(3) ^ c(15) ^ c(31);
  newcrc(20) := c(16);
  newcrc(21) := c(17);
  newcrc(22) := d(0) ^ c(18) ^ c(28);
  newcrc(23) := d(1) ^ d(0)  ^ c(19) ^ c(28) ^ c(29);
  newcrc(24) := d(2) ^ d(1)  ^ c(20) ^ c(29) ^ c(30);
  newcrc(25) := d(3) ^ d(2)  ^ c(21) ^ c(30) ^ c(31);
  newcrc(26) := d(3) ^ d(0)  ^ c(22) ^ c(28) ^ c(31);
  newcrc(27) := d(1) ^ c(23) ^ c(29);
  newcrc(28) := d(2) ^ c(24) ^ c(30);
  newcrc(29) := d(3) ^ c(25) ^ c(31);
  newcrc(30) := c(26);
  newcrc(31) := c(27);

  when (!io.start) {
    c := "hffff_ffff".U
  } .elsewhen (io.enable) {
    c := newcrc.asTypeOf(UInt(32.W))
  } .otherwise {
    c := c
  }

  val crc_r = WireInit(0.U(32.W))
  crc_r := ~c

  io.crc := Cat(crc_r(0) ,crc_r(1) ,crc_r(2) ,crc_r(3) ,crc_r(4) ,crc_r(5) ,crc_r(6) ,crc_r(7) ,
                crc_r(8) ,crc_r(9) ,crc_r(10),crc_r(11),crc_r(12),crc_r(13),crc_r(14),crc_r(15),
                crc_r(16),crc_r(17),crc_r(18),crc_r(19),crc_r(20),crc_r(21),crc_r(22),crc_r(23),
                crc_r(24),crc_r(25),crc_r(26),crc_r(27),crc_r(28),crc_r(29),crc_r(30),crc_r(31))

}

class EthFcsPadding_4bit extends Module {
  val io = IO (new Bundle {
    val rx_en  = Input (Bool())
    val rx_dat = Input (UInt(4.W))
    val tx_en  = Output(Bool())
    val tx_dat = Output(UInt(4.W))
  })

  val crc32_d4 = Module (new EthCRC32_4bit)

  val sIdle :: sPreamble :: sDATA :: sCRC1 :: sCRC2 :: Nil = Enum(5)
  val state   = RegInit(sIdle)

  val counter     = RegInit(0.U(8.W))
  val crc_enable  = RegInit(false.B)
  val crc_out     = WireInit(0.U(32.W))
  val crc_out_r   = RegInit(0.U(32.W))
  val tx_en       = RegInit(false.B)
  val tx_dat      = RegInit(0.U(4.W))

  val rx_valid_r5 = ShiftRegister(io.rx_en,  9)
  val rx_data_r5  = ShiftRegister(io.rx_dat, 9)

  switch (state) {
    is (sIdle) {
      counter := 0.U
      crc_enable := false.B
      when (risingedge(rx_valid_r5)) {
        when (rx_data_r5 === 0x5.U) {
          state := sPreamble
          tx_en := true.B
          tx_dat := rx_data_r5
        }
      } .otherwise {
        tx_en := false.B
        tx_dat := 0.U
      }
    }
    is (sPreamble) {
      tx_dat := rx_data_r5
      counter := counter + 1.U
      when (counter === (16 - 1).U) {
        // if do not find 0xD5; go back to sIdle
        state := sIdle
      } .elsewhen (rx_data_r5 === 0xD.U) {
        state := sDATA
        counter := 0.U
        crc_enable := true.B
      }
    }
    is (sDATA) {
      tx_dat := rx_data_r5
      when (!io.rx_en) {
        state := sCRC1
        counter := 0.U
        crc_enable := false.B
      }
    }
    is (sCRC1) {
      state := sCRC2
      crc_out_r := crc_out >> 4
      tx_dat := crc_out(3, 0)
      counter := counter + 1.U
    }
    is (sCRC2) {
      crc_out_r := crc_out_r >> 4
      counter := counter + 1.U
      when (counter === 8.U) {
        state := sIdle
        tx_en := false.B
        tx_dat := 0.U
        counter := 0.U
      } .otherwise {
        tx_dat := crc_out_r(3, 0)
      }
    }
  }

  crc32_d4.io.data   <> rx_data_r5
  crc32_d4.io.enable <> crc_enable
  crc32_d4.io.start  <> crc_enable
  crc32_d4.io.crc    <> crc_out

  io.tx_en  := tx_en
  io.tx_dat := tx_dat
}

class CRC32_D4 extends Module {
  val io = IO(new Bundle {
    val En         = Input(Bool())
    val Data       = Input(UInt(4.W))
    val Enable     = Input(Bool())
    val Initialize = Input(Bool())
    val CrcError   = Output(Bool())
  })

  val Enable = WireInit(false.B)
  val Data = WireInit(0.U(4.W))
  val Crc = RegInit("hffffffff".U(32.W))
  val CrcNext = WireInit(VecInit(Seq.fill(32)(0.U(1.W))))

  Enable := io.Enable
  Data := io.Data
  
  CrcNext(0)  := Enable & (Data(0) ^ Crc(28)) 
  CrcNext(1)  := Enable & (Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29)) 
  CrcNext(2)  := Enable & (Data(2) ^ Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29) ^ Crc(30)) 
  CrcNext(3)  := Enable & (Data(3) ^ Data(2) ^ Data(1) ^ Crc(29) ^ Crc(30) ^ Crc(31)) 
  CrcNext(4)  := (Enable & (Data(3) ^ Data(2) ^ Data(0) ^ Crc(28) ^ Crc(30) ^ Crc(31))) ^ Crc(0) 
  CrcNext(5)  := (Enable & (Data(3) ^ Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29) ^ Crc(31))) ^ Crc(1) 
  CrcNext(6)  := (Enable & (Data(2) ^ Data(1) ^ Crc(29) ^ Crc(30))) ^ Crc( 2) 
  CrcNext(7)  := (Enable & (Data(3) ^ Data(2) ^ Data(0) ^ Crc(28) ^ Crc(30) ^ Crc(31))) ^ Crc(3) 
  CrcNext(8)  := (Enable & (Data(3) ^ Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29) ^ Crc(31))) ^ Crc(4) 
  CrcNext(9)  := (Enable & (Data(2) ^ Data(1) ^ Crc(29) ^ Crc(30))) ^ Crc(5) 
  CrcNext(10) := (Enable & (Data(3) ^ Data(2) ^ Data(0) ^ Crc(28) ^ Crc(30) ^ Crc(31))) ^ Crc(6) 
  CrcNext(11) := (Enable & (Data(3) ^ Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29) ^ Crc(31))) ^ Crc(7) 
  CrcNext(12) := (Enable & (Data(2) ^ Data(1) ^ Data(0) ^ Crc(28) ^ Crc(29) ^ Crc(30))) ^ Crc(8) 
  CrcNext(13) := (Enable & (Data(3) ^ Data(2) ^ Data(1) ^ Crc(29) ^ Crc(30) ^ Crc(31))) ^ Crc(9) 
  CrcNext(14) := (Enable & (Data(3) ^ Data(2) ^ Crc(30) ^ Crc(31))) ^ Crc(10) 
  CrcNext(15) := (Enable & (Data(3) ^ Crc(31))) ^ Crc(11) 
  CrcNext(16) := (Enable & (Data(0) ^ Crc(28))) ^ Crc(12) 
  CrcNext(17) := (Enable & (Data(1) ^ Crc(29))) ^ Crc(13) 
  CrcNext(18) := (Enable & (Data(2) ^ Crc(30))) ^ Crc(14) 
  CrcNext(19) := (Enable & (Data(3) ^ Crc(31))) ^ Crc(15) 
  CrcNext(20) := Crc(16) 
  CrcNext(21) := Crc(17) 
  CrcNext(22) := (Enable & (Data(0) ^ Crc(28))) ^ Crc(18) 
  CrcNext(23) := (Enable & (Data(1) ^ Data(0) ^ Crc(29) ^ Crc(28))) ^ Crc(19) 
  CrcNext(24) := (Enable & (Data(2) ^ Data(1) ^ Crc(30) ^ Crc(29))) ^ Crc(20) 
  CrcNext(25) := (Enable & (Data(3) ^ Data(2) ^ Crc(31) ^ Crc(30))) ^ Crc(21) 
  CrcNext(26) := (Enable & (Data(3) ^ Data(0) ^ Crc(31) ^ Crc(28))) ^ Crc(22) 
  CrcNext(27) := (Enable & (Data(1) ^ Crc(29))) ^ Crc(23) 
  CrcNext(28) := (Enable & (Data(2) ^ Crc(30))) ^ Crc(24) 
  CrcNext(29) := (Enable & (Data(3) ^ Crc(31))) ^ Crc(25) 
  CrcNext(30) := Crc(26) 
  CrcNext(31) := Crc(27) 
  
  when (io.Initialize) {
    Crc := "hffffffff".U
  } .elsewhen (io.En) {
    Crc := CrcNext.asTypeOf(UInt(32.W))
  }
  
  io.CrcError := Crc =/= "hc704dd7b".U  // CRC not equal to magic number
}

class CRCChecker extends Module {
  val io = IO(new Bundle {
    val mii_clk = Input (Bool())
    val mii_en  = Input (Bool())
    val mii_dat = Input (UInt(4.W))
    val ok      = Output(Bool())
    val err     = Output(Bool())
  })

  val crc32_d4 = Module(new CRC32_D4)

  val mii_clk  = risingedge(io.mii_clk)
  val mii_en   = WireInit(false.B)
  val mii_dat  = WireInit(0.U(4.W))

  mii_en  := io.mii_en
  mii_dat := io.mii_dat

  val (
    sIDLE ::
    sPreamble ::
    sCRC ::
    Nil
  ) = Enum(3)

  val state = RegInit(sIDLE)
  val next_state = WireInit(sIDLE)

  state := next_state
  next_state := state

  io.ok  := false.B
  io.err := false.B

  switch (state) {
    is (sIDLE) {
      when (risingedge(io.mii_en)) {
        next_state := sPreamble
      }
    }
    is (sPreamble) {
      when (mii_clk) {
        when (mii_dat === 0xD.U) {
          next_state := sCRC
        }
      }
    }
    is (sCRC) {
      when (mii_clk) {
        when (~mii_en) {
          next_state := sIDLE
          io.err := crc32_d4.io.CrcError
          io.ok  := ~crc32_d4.io.CrcError
        }
      }
    }
  }

  crc32_d4.io.En          := mii_en && mii_clk
  crc32_d4.io.Data        := Cat(mii_dat(0), mii_dat(1), mii_dat(2), mii_dat(3))
  crc32_d4.io.Enable      := mii_en && state === sCRC
  crc32_d4.io.Initialize  := state === sPreamble
}
