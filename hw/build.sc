import mill._, scalalib._

object chisel extends ScalaModule {
    def scalaVersion = "2.12.8"
    //def millSourcePath = super.millSourcePath / ammonite.ops.up / ammonite.ops.up
    def unmanagedClasspath = T {
        if (!ammonite.ops.exists(millSourcePath / "lib")) Agg()
        else Agg.from(ammonite.ops.ls(millSourcePath / "lib").map(PathRef(_)))
    }
   def scalacOptions = Seq(
     "-deprecation",
     "-feature",
     "-unchecked",
     "-Xsource:2.11",
     "-language:reflectiveCalls"
   )
}
