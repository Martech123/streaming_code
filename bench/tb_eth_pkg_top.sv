// test for eth pkg

`timescale 1ns/10ps

module tb_eth_pkg_top ();

      reg         clock;
      reg         reset;
      reg         io_enable;
      reg         io_suspend;
      reg         io_send_mode;
      reg  [31:0] io_send_count;
      wire        io_send_done;
      reg         io_pkt_len_mode;
      reg  [15:0] io_pkt_len_init;
      reg  [15:0] io_inter_frame_gap;
      reg  [1:0]  io_payload_mode;
      reg  [47:0] io_da;
      reg  [47:0] io_sa;
      reg  [15:0] io_etype;
      wire        io_tx_en;
      wire [7:0]  io_tx_data;
      reg         io_total_send_count_clr;
      wire [47:0] io_total_send_count;


    eth_pkg_top dut (
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
        .io_tx_en               (io_tx_en               ),
        .io_tx_data             (io_tx_data             ),
        .io_total_send_count_clr(io_total_send_count_clr),
        .io_total_send_count    (io_total_send_count    )
    );


    initial begin
      clock = 1'b0;
      reset = 1'b1;
      io_enable = 1'b0;
      io_suspend = 1'b0;
      io_send_mode = 1'b0;
      io_send_count = 32'h0100;
      io_pkt_len_mode = 1'b1;
      io_pkt_len_init = 16'h0064;
      io_inter_frame_gap = 16'd12;
      io_payload_mode = 2'd2;
      io_da = 48'haabbccddeeff;
      io_sa = 48'h001122334455;
      io_etype = 16'h8800;
      io_total_send_count_clr = 1'b0;

      # 10000;
        reset = 1'b0;
        io_enable = 1'b1; 
    end

    always #25 clock = ~clock;

endmodule
