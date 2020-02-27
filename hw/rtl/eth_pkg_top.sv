// baset1000/100/10 send pkg

module eth_pkg_top
#(// Number of PCIe Lanes
    parameter C_NUM_LANES =  8
  )
(
  input           SYSCLK_P,
  input           SYSCLK_N,
  input           RESET,
  output          LED,

  // ADC1 ~ ADC4
  input   [7:0]   ADC1_DA,
  input   [7:0]   ADC1_DB,
  input   [7:0]   ADC2_DA,
  input   [7:0]   ADC2_DB,
  input   [7:0]   ADC3_DA,
  input   [7:0]   ADC3_DB,
  input   [7:0]   ADC4_DA,
  input   [7:0]   ADC4_DB,

  input           ADC1_DCOP,
  input           ADC1_DCON,
  input           ADC2_DCOP,
  input           ADC2_DCON,
  input           ADC3_DCOP,
  input           ADC3_DCON,
  input           ADC4_DCOP,
  input           ADC4_DCON,

  // DAC1 ~ DAC4
  output  [10:6]  DAC1_DAN,
  output  [10:6]  DAC1_DAP,
  output  [10:6]  DAC1_DBN,
  output  [10:6]  DAC1_DBP,
  output          DAC1_DCKIN,
  output          DAC1_DCKIP,
  input           DAC1_DCKON,
  input           DAC1_DCKOP,
  input           DAC1_TSTN,
  input           DAC1_TSTP,

  output  [10:6]  DAC2_DAN,
  output  [10:6]  DAC2_DAP,
  output  [10:6]  DAC2_DBN,
  output  [10:6]  DAC2_DBP,
  output          DAC2_DCKIN,
  output          DAC2_DCKIP,
  input           DAC2_DCKON,
  input           DAC2_DCKOP,
  input           DAC2_TSTN,
  input           DAC2_TSTP,

  output  [10:6]  DAC3_DAN,
  output  [10:6]  DAC3_DAP,
  output  [10:6]  DAC3_DBN,
  output  [10:6]  DAC3_DBP,
  output          DAC3_DCKIN,
  output          DAC3_DCKIP,
  input           DAC3_DCKON,
  input           DAC3_DCKOP,
  input           DAC3_TSTN,
  input           DAC3_TSTP,

  output  [10:6]  DAC4_DAN,
  output  [10:6]  DAC4_DAP,
  output  [10:6]  DAC4_DBN,
  output  [10:6]  DAC4_DBP,
  output          DAC4_DCKIN,
  output          DAC4_DCKIP,
  input           DAC4_DCKON,
  input           DAC4_DCKOP,
  input           DAC4_TSTN,
  input           DAC4_TSTP,

  input           FMC_IO_31,
  input           FMC_IO_30,
  input           FMC_IO_29,
  output          FMC_IO_28,
  output  [27:0]  FMC_IO,
  // PCIE interface
  input          PCIE_REFCLK_P,
  input          PCIE_REFCLK_N,
  input          PCIE_RESET_N,
  output         LED_PCIE,
  output         LED_FIFO_FULL,

  output [(C_NUM_LANES - 1) : 0]   PCI_EXP_TXP,
  output [(C_NUM_LANES - 1) : 0]   PCI_EXP_TXN,
  input  [(C_NUM_LANES - 1) : 0]   PCI_EXP_RXP,
  input  [(C_NUM_LANES - 1) : 0]   PCI_EXP_RXN
);

  assign FMC_IO = 28'b0;


  wire        io_mii_en;
  wire [3:0]  io_mii_data;


  assign io_tx_en = io_mii_en;
  assign io_tx_data = io_mii_data;

  wire             clk_div8;

  wire             clock;
  wire             reset;
  wire             io_enable;
  wire             io_suspend;
  wire             io_send_mode;
  wire [31:0]      io_send_count;
  wire             io_send_done;
  wire             io_pkt_len_mode;
  wire [15:0]      io_pkt_len_init;
  wire [15:0]      io_inter_frame_gap;
  wire [1:0]       io_payload_mode;
  wire [47:0]      io_da;
  wire [47:0]      io_sa;
  wire [15:0]      io_etype;
  wire             io_total_send_count_clr;
  wire [47:0]      io_total_send_count;

  BUFR #(
      .BUFR_DIVIDE("8"), // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
      .SIM_DEVICE("7SERIES") // Must be set to "7SERIES"
  ) BUFR_div5_tx (
      .O(clk_div8),
      .CE(1'b1),
      .CLR(1'b0),
      .I(clock)
  );

  PktGen8bit dut (
      .clock                  (clock                  ),
      .reset                  (reset                  ),
      .io_enable              (io_enable              ),
      .io_suspend             (io_suspend             ),
      .io_send_mode           (io_send_mode           ),
      .io_send_count          (io_send_count          ),
      .io_send_done           (io_send_done           ),
      .io_pkt_len_mode        (io_pkt_len_mode        ),
      .io_pkt_len_init        (io_pkt_len_init        ),
      .io_inter_frame_gap     (io_inter_frame_gap     ),
      .io_payload_mode        (io_payload_mode        ),
      .io_da                  (io_da                  ),
      .io_sa                  (io_sa                  ),
      .io_etype               (io_etype               ),
      .io_tx_en               (io_mii_en              ),
      .io_tx_data             (io_mii_data            ),
      .io_total_send_count_clr(io_total_send_count_clr),
      .io_total_send_count    (io_total_send_count    )
    );

//    PktGen4bit dut1 (
//        .clock                  (clk_div8               ),
//        .reset                  (RESET                  ),
//        .io_enable              (io_enable              ),
//        .io_suspend             (io_suspend             ),
//        .io_send_mode           (io_send_mode           ),
//        .io_send_count          (io_send_count          ),
//        .io_send_done           (io_send_done           ),
//        .io_pkt_len_mode        (io_pkt_len_mode        ),
//        .io_pkt_len_init        (io_pkt_len_init        ),
//        .io_inter_frame_gap     (io_inter_frame_gap     ),
//        .io_payload_mode        (io_payload_mode        ),
//        .io_da                  (io_da                  ),
//        .io_sa                  (io_sa                  ),
//        .io_etype               (io_etype               ),
//        .io_tx_en               (io_mii_en              ),
//        .io_tx_data             (io_mii_data            ),
//        .io_total_send_count_clr(io_total_send_count_clr),
//        .io_total_send_count    (io_total_send_count    )
//    );



  wire io_ok;
  wire io_err;

  CRCChecker check4bit (
      .clock                         (clock),
      .reset                         (reset),
      .io_mii_clk                    (clk_div8),
      .io_mii_en                     (io_mii_en),
      .io_mii_dat                    (io_mii_data),
      .io_ok                         (io_ok),
      .io_err                        (io_err)
    );


  rgmii rgmii_inst (
      .rgmii_125m                   (clock),
      .rgmii_125m90                 (),
      .reset                        (reset),


      .RGMII_RX_CLK                 (),
      .RGMII_RX_DV                  (),
      .RGMII_RX_D                   (),
      .RGMII_TX_CLK                 (rgmii_tx_clk),
      .RGMII_TX_EN                  (rgmii_tx_en),
      .RGMII_TX_D                   (rgmii_tx_data),


      .gmii_txd                     (),
      .gmii_tx_en                   (),
      .gmii_tx_pktlen               (),
      .gmii_rxd                     (io_mii_data),
      .gmii_rx_dv                   (io_mii_en),

      .crc_error                    ()
    );

  spi_debug_if spi_debug_if_inst (
      // Digital Registers IO
      .io_send_done_in              (io_send_done),
      .io_send_mode_out             (io_send_mode),
      .io_send_count_hign_out       (io_send_count[31:16]),
      .io_send_count_low_out        (io_send_count[15:0]),
      .io_etype_out                 (io_etype),
      .io_pkt_len_mode_out          (io_pkt_len_mode),
      .io_suspend_out               (io_suspend),
      .CHIP_VER_in                  (16'hbeef),
      .io_da_h_out                  (io_da[47:32]),
      .io_da_l_out                  (io_da[15:0]),
      .io_payload_mode_out          (io_payload_mode),
      .io_da_m_out                  (io_da[32:16]),
      .io_total_send_count_l_in     (io_total_send_count[15:0]),
      .io_total_send_count_m_in     (io_total_send_count[31:16]),
      .io_total_send_count_h_in     (io_total_send_count[47:32]),
      .io_sa_h_out                  (io_sa[47:32]),
      .io_sa_m_out                  (io_sa[31:16]),
      .io_sa_l_out                  (io_sa[15:0]),
      .reset_out                    (reset),
      .io_inter_frame_gap_out       (io_inter_frame_gap),
      .io_total_send_count_clr_out  (io_total_send_count_clr),
      .io_pkt_len_init_out          (io_pkt_len_init),
      .io_enable_out                (io_enable),
      //----------SPI Interface-------------
      .resetn                       (RESET),
      .sclk_i                       (FMC_IO_31),
      .mosi_i                       (FMC_IO_30),
      .cs_i                         (FMC_IO_29),
      .miso_o                       (FMC_IO_28)
    );

endmodule
