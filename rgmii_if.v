module rgmii_if (
  // Synchronous resets
  input            tx_reset90,
  input            tx_reset,
  input            rx_reset,

  // The following ports are the RGMII physical interface: these will be at
  // pins on the FPGA
  output     [3:0] rgmii_txd,
  output           rgmii_tx_ctl,
  output           rgmii_txc,
  input      [3:0] rgmii_rxd,
  input            rgmii_rx_ctl,
  input            rgmii_rxc,

  // The following signals are in the RGMII in-band status signals
  output reg       link_status,
  output reg [1:0] clock_speed,
  output reg       duplex_status,

  // The following ports are the internal GMII connections from IOB logic
  // to the TEMAC core
  input      [7:0] txd_from_mac,
  input            tx_en_from_mac,
  input            tx_er_from_mac,
  input            tx_clk,
  input            tx_clk90,
  output     [7:0] rxd_to_mac,
  output           rx_dv_to_mac,
  output           rx_er_to_mac,

  // Receiver clock for the MAC and Client Logic
  output           rx_clk
);

//----------------------------------------------------------------------------
// internal signals
//----------------------------------------------------------------------------

wire   [3:0] rgmii_txd_obuf;
wire         rgmii_tx_ctl_obuf;
wire         rgmii_txc_obuf;
wire   [3:0] rgmii_rxd_ibuf;
wire         rgmii_rx_ctl_ibuf;
wire         rgmii_rxc_ibuf;

wire   [3:0] gmii_txd_falling;             // gmii_txd signal registered on the falling edge of tx_clk.
wire         rgmii_tx_ctl_int;             // Internal RGMII transmit control signal.
wire         rgmii_rx_ctl_delay;
wire   [3:0] rgmii_rxd_delay;
wire         rgmii_rx_clk_bufio;
wire         rgmii_rx_ctl_reg;             // Internal RGMII receiver control signal.

wire         gmii_rx_dv_reg;               // gmii_rx_dv registered in IOBs.
wire         gmii_rx_er_reg;               // gmii_rx_er registered in IOBs.
wire   [7:0] gmii_rxd_reg;                 // gmii_rxd registered in IOBs.

wire         inband_ce;                    // RGMII inband status registers clock enable
wire         rx_clk_int;

//----------------------------------------------------------------------------
// Input/Output Buffers
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// RGMII
//----------------------------------------------------------------------------

OBUF rgmii_txc_obuf_i (
   .I              (rgmii_txc_obuf),
   .O              (rgmii_txc)
);

OBUF rgmii_tx_ctl_obuf_i (
   .I              (rgmii_tx_ctl_obuf),
   .O              (rgmii_tx_ctl)
);

genvar loopa;
generate for (loopa = 0; loopa < 4; loopa = loopa + 1)
  begin : obuf_data
    OBUF rgmii_txd_obuf_i (
     .I  (rgmii_txd_obuf[loopa]),
     .O  (rgmii_txd     [loopa])
    );
  end
endgenerate

IBUF rgmii_rxc_ibuf_i (
 .I  (rgmii_rxc     ),
 .O  (rgmii_rxc_ibuf)
);

IBUF rgmii_rx_ctl_ibuf_i (
   .I              (rgmii_rx_ctl),
   .O              (rgmii_rx_ctl_ibuf)
);

genvar loopi;
generate for (loopi = 0; loopi < 4; loopi = loopi + 1)
  begin : ibuf_data
    IBUF rgmii_rxd_ibuf_i (
      .I  (rgmii_rxd     [loopi]),
      .O  (rgmii_rxd_ibuf[loopi])
    );
  end
endgenerate

//----------------------------------------------------------------------------
// Route internal signals to output ports :
//----------------------------------------------------------------------------

assign rxd_to_mac      = gmii_rxd_reg;
assign rx_dv_to_mac    = gmii_rx_dv_reg;
assign rx_er_to_mac    = gmii_rx_er_reg;

//----------------------------------------------------------------------------
// RGMII Transmitter Clock Management :
//----------------------------------------------------------------------------
// Instantiate the Output DDR primitive
ODDR #(
  .DDR_CLK_EDGE  ("SAME_EDGE")
) rgmii_txc_ddr (
  .Q   (rgmii_txc_obuf),
  .C   (tx_clk90      ),
  .CE  (1'b1),
  .D1  (1'b1),
  .D2  (1'b0),
  .R   (tx_reset90    ),
  .S   (1'b0)
);

//---------------------------------------------------------------------------
// RGMII Transmitter Logic :
// drive TX signals through IOBs onto RGMII interface
//---------------------------------------------------------------------------

// Encode rgmii ctl signal
assign rgmii_tx_ctl_int = tx_en_from_mac ^ tx_er_from_mac;


// Instantiate Double Data Rate Output components.
assign gmii_txd_falling = txd_from_mac[7:4];

genvar i;
generate for (i=0; i<4; i=i+1)
  begin : txdata_out_bus
    ODDR #(
      .DDR_CLK_EDGE  ("SAME_EDGE")
    )
    rgmii_txd_out (
      .Q             (rgmii_txd_obuf[i]  ),
      .C             (tx_clk             ),
      .CE            (1'b1),
      .D1            (txd_from_mac[i]    ),
      .D2            (gmii_txd_falling[i]),
      .R             (tx_reset           ),
      .S             (1'b0)
    );
  end
endgenerate

ODDR #(
  .DDR_CLK_EDGE  ("SAME_EDGE")
)
ctl_output (
  .Q             (rgmii_tx_ctl_obuf),
  .C             (tx_clk           ),
  .CE            (1'b1             ),
  .D1            (tx_en_from_mac   ),
  .D2            (rgmii_tx_ctl_int ),
  .R             (tx_reset         ),
  .S             (1'b0             )
);

//---------------------------------------------------------------------------
// RGMII Receiver Clock Logic
//---------------------------------------------------------------------------

// Route rgmii_rxc through a BUFIO/BUFR and onto regional clock routing
BUFIO bufio_rgmii_rx_clk (
  .I             (rgmii_rxc_ibuf    ),
  .O             (rgmii_rx_clk_bufio)
);

// Route rx_clk through a BUFR onto regional clock routing
BUFR bufr_rgmii_rx_clk (
  .I             (rgmii_rxc_ibuf),
  .CE            (1'b1          ),
  .CLR           (1'b0          ),
  .O             (rx_clk_int    )
);

// Assign the internal clock signal to the output port
assign rx_clk = rx_clk_int;

//---------------------------------------------------------------------------
// RGMII Receiver Logic : receive signals through IOBs from RGMII interface
//---------------------------------------------------------------------------

// Drive input RGMII Rx signals from PADS through IODELAYS.

// Please modify the IODELAY_VALUE according to your design.
// For more information on IDELAYCTRL and IODELAY, please refer to
// the User Guide.

IDELAYE2 #(
  .IDELAY_TYPE   ("FIXED")
)
delay_rgmii_rx_ctl (
  .IDATAIN       (rgmii_rx_ctl_ibuf ),
  .DATAOUT       (rgmii_rx_ctl_delay),
  .DATAIN        (1'b0),
  .C             (1'b0),
  .CE            (1'b0),
  .INC           (1'b0),
  .CINVCTRL      (1'b0),
  .CNTVALUEIN    (5'h0),
  .CNTVALUEOUT   (),
  .LD            (1'b0),
  .LDPIPEEN      (1'b0),
  .REGRST        (1'b0)
);

genvar j;
generate for (j = 0; j < 4; j = j + 1)
  begin : rxdata_bus
    IDELAYE2 #(
      .IDELAY_TYPE   ("FIXED")
    )
    delay_rgmii_rxd (
      .IDATAIN       (rgmii_rxd_ibuf[j] ),
      .DATAOUT       (rgmii_rxd_delay[j]),
      .DATAIN        (1'b0),
      .C             (1'b0),
      .CE            (1'b0),
      .INC           (1'b0),
      .CINVCTRL      (1'b0),
      .CNTVALUEIN    (5'h0),
      .CNTVALUEOUT   (),
      .LD            (1'b0),
      .LDPIPEEN      (1'b0),
      .REGRST        (1'b0)
    );
  end
endgenerate

// Instantiate Double Data Rate Input flip-flops.
// DDR_CLK_EDGE attribute specifies output data alignment from IDDR component

genvar k;
generate for (k = 0; k < 4; k = k + 1)
  begin : rxdata_in_bus
    IDDR #(
      .DDR_CLK_EDGE  ("SAME_EDGE_PIPELINED")
    )
    rgmii_rx_data_in (
      .Q1            (gmii_rxd_reg[k]   ),
      .Q2            (gmii_rxd_reg[k+4] ),
      .C             (rgmii_rx_clk_bufio),
      .CE            (1'b1),
      .D             (rgmii_rxd_delay[k]),
      .R             (1'b0),
      .S             (1'b0)
    );
  end
endgenerate

IDDR #(
  .DDR_CLK_EDGE  ("SAME_EDGE_PIPELINED")
)
rgmii_rx_ctl_in (
  .Q1            (gmii_rx_dv_reg),
  .Q2            (rgmii_rx_ctl_reg),
  .C             (rgmii_rx_clk_bufio),
  .CE            (1'b1),
  .D             (rgmii_rx_ctl_delay),
  .R             (1'b0),
  .S             (1'b0)
);

// Decode gmii_rx_er signal
assign gmii_rx_er_reg = gmii_rx_dv_reg ^ rgmii_rx_ctl_reg;

//----------------------------------------------------------------------------
// RGMII Inband Status Registers
// extract the inband status from received rgmii data
//----------------------------------------------------------------------------

// Enable inband status registers during Interframe Gap
assign inband_ce = !(gmii_rx_dv_reg || gmii_rx_er_reg);

always @ (posedge rx_clk_int) begin
  if (rx_reset) begin
    link_status          <= 1'b0;
    clock_speed[1:0]     <= 2'b0;
    duplex_status        <= 1'b0;
  end
  else if (inband_ce) begin
    link_status          <= gmii_rxd_reg[0];
    clock_speed[1:0]     <= gmii_rxd_reg[2:1];
    duplex_status        <= gmii_rxd_reg[3];
  end
end

endmodule
