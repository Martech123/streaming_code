package eth_pkg

object Main extends App {
  val modules = Seq(
          () => new CRCChecker,
          () => new EthFcsPadding_4bit,
          () => new EthFcsPadding,
          () => new PktGen8bit,
          () => new PktGen4bit
        )

  for (m <- modules) {
    chisel3.Driver.execute(args.tail, m)
  }

}
