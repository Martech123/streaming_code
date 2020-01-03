// Dummy Top for Auto Gen Regfile
module spi_debug_if (
  // Digital Registers IO
  input [15:0] CHIP_VER_in,
  input [15:0] error_cnt_in,
  input [15:0] data_adc1_in,
  output [15:0] ram_addr_adc4_out,
  input [15:0] data_adc3_in,
  output [15:0] ram_addr_adc2_out,
  output [15:0] ram_addr_adc3_out,
  output [15:0] ram_addr_adc1_out,
  output        capture_start_out,
  input        capture_ready_in,
  output [1:0] sel_adc_out,
  input [15:0] data_adc2_in,
  input [15:0] data_adc4_in,

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
    .CHIP_VER_in_i (CHIP_VER_in),
    .error_cnt_in_i (error_cnt_in),
    .data_adc1_in_i (data_adc1_in),
    .ram_addr_adc4_out_o (ram_addr_adc4_out),
    .data_adc3_in_i (data_adc3_in),
    .ram_addr_adc2_out_o (ram_addr_adc2_out),
    .ram_addr_adc3_out_o (ram_addr_adc3_out),
    .ram_addr_adc1_out_o (ram_addr_adc1_out),
    .capture_start_out_o (capture_start_out),
    .capture_ready_in_i (capture_ready_in),
    .sel_adc_out_o (sel_adc_out),
    .data_adc2_in_i (data_adc2_in),
    .data_adc4_in_i (data_adc4_in),
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
