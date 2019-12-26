module rgmii (
  input           rgmii_125m,
  input           rgmii_125m90,
  input           reset,

  // rgmii
  output          RGMII_RX_CLK,
  output          RGMII_RX_DV,
  output  [3:0]   RGMII_RX_D,
  input           RGMII_TX_CLK,
  input           RGMII_TX_EN,
  input   [3:0]   RGMII_TX_D,

  // gmii
  output  [7:0]   gmii_txd,
  output          gmii_tx_en,
  output [15:0]   gmii_tx_pktlen,
  input   [7:0]   gmii_rxd,
  input           gmii_rx_dv,

  output          crc_error
);

wire [7:0] r_gmii_txd;
wire       r_gmii_tx_en;
wire       r_gmii_tx_clk;
reg  [7:0] r_gmii_rxd;
reg        r_gmii_rx_dv;
wire       r_gmii_rx_clk;
wire       r_gmii_rx_clk90;

rgmii_inner rgmii_inner_inst (
  .reset            (reset           ),
  .gmii_txd_o       (r_gmii_txd      ),
  .gmii_tx_en_o     (r_gmii_tx_en    ),
  .gmii_tx_clk_o    (r_gmii_tx_clk   ),
  .gmii_rxd_i       (r_gmii_rxd      ),
  .gmii_rx_dv_i     (r_gmii_rx_dv    ),
  .gmii_rx_clk_i    (r_gmii_rx_clk   ),
  .gmii_rx_clk90_i  (r_gmii_rx_clk90 ),

  .rgmii_txclk_i    (RGMII_TX_CLK    ),
  .rgmii_txd_i      (RGMII_TX_D      ),
  .rgmii_tx_en_i    (RGMII_TX_EN     ),
  .rgmii_rxclk_o    (RGMII_RX_CLK    ),
  .rgmii_rxd_o      (RGMII_RX_D      ),
  .rgmii_rx_dv_o    (RGMII_RX_DV     )
);

gmii_fifo gmii_rx_fifo (
  .resetn           (~reset          ),
  .gmii_data_in     (r_gmii_txd      ),
  .gmii_en_in       (r_gmii_tx_en    ),
  .gmii_rx_clk      (r_gmii_tx_clk   ),

  .gmii_tx_clk      (rgmii_125m      ),
  .gmii_data_out    (gmii_txd        ),
  .gmii_en_out      (gmii_tx_en      ),
  .length           (gmii_tx_pktlen  ),
  .crc_error        (crc_error       )
);

assign r_gmii_rx_clk   = rgmii_125m;
assign r_gmii_rx_clk90 = rgmii_125m90;

always @ (posedge rgmii_125m or posedge reset) begin
  if(reset) begin
    r_gmii_rxd   <= 0;
    r_gmii_rx_dv <= 0;
  end
  else begin
    r_gmii_rxd   <= gmii_rxd;
    r_gmii_rx_dv <= gmii_rx_dv;
  end
end

endmodule

module rgmii_inner (
  input        reset,
  output [7:0] gmii_txd_o,
  output       gmii_tx_en_o,
  output       gmii_tx_clk_o,

  input  [7:0] gmii_rxd_i,
  input        gmii_rx_dv_i,
  input        gmii_rx_clk_i,
  input        gmii_rx_clk90_i,

  input  [3:0] rgmii_txd_i,
  input        rgmii_tx_en_i,
  input        rgmii_txclk_i,
  output [3:0] rgmii_rxd_o,
  output       rgmii_rx_dv_o,
  output       rgmii_rxclk_o
);

wire reset90;

rgmii_reset90_sync rgmii_reset90_sync (
  .clk              (gmii_rx_clk90_i),
  .data_in          (reset          ),
  .data_out         (reset90        )
);

wire       link_status;
wire [1:0] clock_speed;
wire       duplex_status;

//---------------------------------------------------------------------------
// Instantiate RGMII Interface
//---------------------------------------------------------------------------

rgmii_if rgmii_if_inst (
  // Synchronous resets
  .tx_reset90       (reset90        ),
  .tx_reset         (reset          ),
  .rx_reset         (reset          ),

  // The following ports are the RGMII physical interface: these will be at
  // pins on the FPGA
  .rgmii_txd        (rgmii_rxd_o    ),
  .rgmii_tx_ctl     (rgmii_rx_dv_o  ),
  .rgmii_txc        (rgmii_rxclk_o  ),
  .rgmii_rxd        (rgmii_txd_i    ),
  .rgmii_rx_ctl     (rgmii_tx_en_i  ),
  .rgmii_rxc        (rgmii_txclk_i  ),

  // The following signals are in the RGMII in-band status signals
  .link_status      (link_status    ),
  .clock_speed      (clock_speed    ),
  .duplex_status    (duplex_status  ),

  // The following ports are the internal GMII connections from IOB logic
  // to the TEMAC core
  .txd_from_mac     (gmii_rxd_i     ),
  .tx_en_from_mac   (gmii_rx_dv_i   ),
  .tx_er_from_mac   (1'b0           ),
  .tx_clk           (gmii_rx_clk_i  ),
  .tx_clk90         (gmii_rx_clk90_i),

  .rxd_to_mac       (gmii_txd_o     ),
  .rx_dv_to_mac     (gmii_tx_en_o   ),
  .rx_er_to_mac     (),

  // Receiver clock for the MAC and Client Logic
  .rx_clk           (gmii_tx_clk_o  )
);

endmodule
