// baset1000/100/10 send pkg

module eth_pkg_top (
  input         clock,
  input         reset,
  input  [1 :0] io_eth_mode,
  input         io_enable,
  input         io_suspend,
  input         io_send_mode,
  input  [31:0] io_send_count,
  output        io_send_done,
  input         io_pkt_len_mode,
  input  [15:0] io_pkt_len_init,
  input  [15:0] io_inter_frame_gap,
  input  [1:0]  io_payload_mode,
  input  [47:0] io_da,
  input  [47:0] io_sa,
  input  [15:0] io_etype,
  output        io_tx_en,
  output [7:0]  io_tx_data,
  input         io_total_send_count_clr,
  output [47:0] io_total_send_count
);



//    PktGen8bit dut (
//        .clock                  (clock                  ),
//        .reset                  (reset                  ),
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
//        .io_tx_en               (io_tx_en               ),
//        .io_tx_data             (io_tx_data             ),
//        .io_total_send_count_clr(io_total_send_count_clr),
//        .io_total_send_count    (io_total_send_count    )
//    );

  wire        io_mii_en;
  wire [3:0]  io_mii_data;


  assign io_tx_en = io_mii_en;
  assign io_tx_data = {4'd0, io_mii_data};

  wire clk_div8;
  BUFR #(
      .BUFR_DIVIDE("8"), // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
      .SIM_DEVICE("7SERIES") // Must be set to "7SERIES"
  ) BUFR_div5_tx (
      .O(clk_div8),
      .CE(1'b1),
      .CLR(1'b0),
      .I(clock) 
  );


    PktGen4bit dut1 (
        .clock                  (clk_div8               ),
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



    wire io_ok;
    wire io_err;

    CRCChecker check4bit (
        .clock              (clock),
        .reset              (reset),
        .io_mii_clk         (clk_div8),
        .io_mii_en          (io_mii_en),
        .io_mii_dat         (io_mii_data),
        .io_ok              (io_ok),
        .io_err             (io_err) 
    );
    

endmodule

