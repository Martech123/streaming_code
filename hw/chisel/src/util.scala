package eth_pkg

import scala.math.{pow, log, ceil}
import util.Random
import chisel3._
import chisel3.util._
import chisel3.core.dontTouch
import scala.collection.mutable.ArrayBuffer
import scala.util.control._

object LocalFunction {
  def gcd(a: Int, b: Int): Int = if (b == 0) a.abs else gcd(b, a % b)
  def risingedge(x: Bool) = x && !RegNext(x)
  def fallingedge(x: Bool) = !x && RegNext(x)
  def align16(size: UInt) = (((size) + (16.U) - 1.U) & ~((16.U) - 1.U))
}

object CondMux {
  def apply(xs: IndexedSeq[(Bool, UInt)]) = xs.foldRight(0.U)((ele, res) => Mux(ele._1, ele._2, res))
}

object extract {
  def apply(des: UInt, field: (Int, Int)) = {
    val des_vec = des.asTypeOf(VecInit(Seq.fill(4)(0.U(32.W))))
    des_vec(field._1)(field._2)
  }
  def apply(des: UInt, field: (Int, Int, Int)) = {
    val des_vec = des.asTypeOf(VecInit(Seq.fill(4)(0.U(32.W))))
    des_vec(field._1)(field._2, field._3)
  }
}
