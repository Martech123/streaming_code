// Dummy Top for Auto Gen Regfile
module spi_debug_if (
  // Digital Registers IO
  input        io_send_done_in,
  output        io_send_mode_out,
  output [15:0] io_send_count_hign_out,
  output        io_suspend_out,
  output [15:0] io_send_count_low_out,
  output [15:0] io_etype_out,
  output        io_pkt_len_mode_out,
  input [15:0] CHIP_VER_in,
  output [15:0] io_da_h_out,
  output [15:0] io_da_l_out,
  output [1:0] io_payload_mode_out,
  output [15:0] io_da_m_out,
  input [15:0] io_total_send_count_l_in,
  input [15:0] io_total_send_count_m_in,
  input [15:0] io_total_send_count_h_in,
  output [15:0] io_sa_h_out,
  output [15:0] io_sa_m_out,
  output [15:0] io_sa_l_out,
  output        reset_out,
  output [15:0] io_inter_frame_gap_out,
  output        io_total_send_count_clr_out,
  output [15:0] io_pkt_len_init_out,
  output        io_enable_out,

  //----------SPI Interface-------------
  input resetn,
  input sclk_i,
  input mosi_i,
  input cs_i,
  output miso_o
);
  // --------------------------------------------------------------------------

  wire        rf_clk_i;
  wire         rf_we_i;
  wire         rf_ce_i;
  wire  [9:0]  rf_addr_i;
  /* verilator lint_off UNUSED */
  wire  [15:0] rf_wdata_i;
  // Output Ports
  wire        rf_valid_o;
  wire        rf_error_o;
  wire [15:0] rf_rdata_o;

  // Analog Register File
  auto_regfile rf(
    .io_send_done_in_i (io_send_done_in),
    .io_send_mode_out_o (io_send_mode_out),
    .io_send_count_hign_out_o (io_send_count_hign_out),
    .io_suspend_out_o (io_suspend_out),
    .io_send_count_low_out_o (io_send_count_low_out),
    .io_etype_out_o (io_etype_out),
    .io_pkt_len_mode_out_o (io_pkt_len_mode_out),
    .CHIP_VER_in_i (CHIP_VER_in),
    .io_da_h_out_o (io_da_h_out),
    .io_da_l_out_o (io_da_l_out),
    .io_payload_mode_out_o (io_payload_mode_out),
    .io_da_m_out_o (io_da_m_out),
    .io_total_send_count_l_in_i (io_total_send_count_l_in),
    .io_total_send_count_m_in_i (io_total_send_count_m_in),
    .io_total_send_count_h_in_i (io_total_send_count_h_in),
    .io_sa_h_out_o (io_sa_h_out),
    .io_sa_m_out_o (io_sa_m_out),
    .io_sa_l_out_o (io_sa_l_out),
    .reset_out_o (reset_out),
    .io_inter_frame_gap_out_o (io_inter_frame_gap_out),
    .io_total_send_count_clr_out_o (io_total_send_count_clr_out),
    .io_pkt_len_init_out_o (io_pkt_len_init_out),
    .io_enable_out_o (io_enable_out),
    //-----SRAM Interface-----
    .clk_i   (rf_clk_i),
    .rstb_i  (resetn),
    .we_i    (rf_we_i),
    .valid_i (rf_ce_i),
    .addr_i  (rf_addr_i),
    .data_i  (rf_wdata_i),
    .data_o  (rf_rdata_o),
    .valid_o (rf_valid_o),
    .error_o (rf_error_o)
  );

  spi_slave spi_slave_inst (
    .rstb_i  (resetn),

    .sclk_i  (sclk_i),
    .mosi_i  (mosi_i),
    .cs_i    (cs_i),
    .miso_o  (miso_o),

    .rdata_i (rf_rdata_o),
    .clk_o   (rf_clk_i),
    .ce_o    (rf_ce_i),
    .we_o    (rf_we_i),
    .addr_o  (rf_addr_i),
    .wdata_o (rf_wdata_i),
    .busy_o  ()
);

endmodule

// vim: ts=2 sw=2 sts=2 et:
