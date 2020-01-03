// auto_regfile
module auto_regfile (
  //-----Analog Interface IO-------
  input  [15:0] CHIP_VER_in_i,
  input  [15:0] error_cnt_in_i,
  input  [15:0] data_adc1_in_i,
  output [15:0] ram_addr_adc4_out_o,
  input  [15:0] data_adc3_in_i,
  output [15:0] ram_addr_adc2_out_o,
  output [15:0] ram_addr_adc3_out_o,
  output [15:0] ram_addr_adc1_out_o,
  output        capture_start_out_o,
  input         capture_ready_in_i,
  output [1:0] sel_adc_out_o,
  input  [15:0] data_adc2_in_i,
  input  [15:0] data_adc4_in_i,

  //-----SRAM Interface IO-------
  // Input Ports
  input                   clk_i,
  input                   rstb_i,
  input                   we_i,
  input                   valid_i,
  input  [9:0]            addr_i,
  input  [15:0]           data_i,
  // Output Ports
  output                  valid_o,
  output                  error_o,
  output [15:0]           data_o
);

  //----------Internal Variables-------------
  reg [15:0] data_out;
  reg        error_r;

  reg        read_valid_1;
  reg        read_valid_2;
  reg        read_valid;

  // Analog Internal Variables
  wire [15:0] CHIP_VER_sram_out;
  wire [15:0] CHIP_VER_data_out;

  wire [15:0] error_cnt_sram_out;
  wire [15:0] error_cnt_data_out;

  wire [15:0] data_adc1_sram_out;
  wire [15:0] data_adc1_data_out;

  reg        ram_addr_adc4_we;
  reg  [15:0] ram_addr_adc4_sram_in;
  wire [15:0] ram_addr_adc4_sram_out;
  wire [15:0] ram_addr_adc4_data_out;

  wire [15:0] data_adc3_sram_out;
  wire [15:0] data_adc3_data_out;

  reg        ram_addr_adc2_we;
  reg  [15:0] ram_addr_adc2_sram_in;
  wire [15:0] ram_addr_adc2_sram_out;
  wire [15:0] ram_addr_adc2_data_out;

  reg        ram_addr_adc3_we;
  reg  [15:0] ram_addr_adc3_sram_in;
  wire [15:0] ram_addr_adc3_sram_out;
  wire [15:0] ram_addr_adc3_data_out;

  reg        ram_addr_adc1_we;
  reg  [15:0] ram_addr_adc1_sram_in;
  wire [15:0] ram_addr_adc1_sram_out;
  wire [15:0] ram_addr_adc1_data_out;

  reg        capture_start_we;
  reg        capture_start_sram_in;
  wire       capture_start_sram_out;
  wire       capture_start_data_out;

  wire       capture_ready_sram_out;
  wire       capture_ready_data_out;

  reg        sel_adc_we;
  reg  [1:0] sel_adc_sram_in;
  wire [1:0] sel_adc_sram_out;
  wire [1:0] sel_adc_data_out;

  wire [15:0] data_adc2_sram_out;
  wire [15:0] data_adc2_data_out;

  wire [15:0] data_adc4_sram_out;
  wire [15:0] data_adc4_data_out;



  //---------- Register Instantiation-------------
  // 
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'hbeef))
    CHIP_VER(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (CHIP_VER_sram_out),
    .ana_data_i  (CHIP_VER_in_i)
  );

  // error_cnt[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    error_cnt(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (error_cnt_sram_out),
    .ana_data_i  (error_cnt_in_i)
  );

  // Data_adc[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    data_adc1(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (data_adc1_sram_out),
    .ana_data_i  (data_adc1_in_i)
  );

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    ram_addr_adc4(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (ram_addr_adc4_we),
    .sram_data_i (ram_addr_adc4_sram_in),
    .data_o      (ram_addr_adc4_data_out)
  );
  assign ram_addr_adc4_sram_out = ram_addr_adc4_data_out;
  assign ram_addr_adc4_out_o    = ram_addr_adc4_data_out;

  // Data_adc[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    data_adc3(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (data_adc3_sram_out),
    .ana_data_i  (data_adc3_in_i)
  );

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    ram_addr_adc2(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (ram_addr_adc2_we),
    .sram_data_i (ram_addr_adc2_sram_in),
    .data_o      (ram_addr_adc2_data_out)
  );
  assign ram_addr_adc2_sram_out = ram_addr_adc2_data_out;
  assign ram_addr_adc2_out_o    = ram_addr_adc2_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    ram_addr_adc3(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (ram_addr_adc3_we),
    .sram_data_i (ram_addr_adc3_sram_in),
    .data_o      (ram_addr_adc3_data_out)
  );
  assign ram_addr_adc3_sram_out = ram_addr_adc3_data_out;
  assign ram_addr_adc3_out_o    = ram_addr_adc3_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    ram_addr_adc1(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (ram_addr_adc1_we),
    .sram_data_i (ram_addr_adc1_sram_in),
    .data_o      (ram_addr_adc1_data_out)
  );
  assign ram_addr_adc1_sram_out = ram_addr_adc1_data_out;
  assign ram_addr_adc1_out_o    = ram_addr_adc1_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    capture_start(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (capture_start_we),
    .sram_data_i (capture_start_sram_in),
    .data_o      (capture_start_data_out)
  );
  assign capture_start_sram_out = capture_start_data_out;
  assign capture_start_out_o    = capture_start_data_out;

  // 
  regmap_cell_rd #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    capture_ready(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (capture_ready_sram_out),
    .ana_data_i  (capture_ready_in_i)
  );

  // 
  regmap_cell_wr #(.DATA_WIDTH(2), .RST_VAL(2'h0))
    sel_adc(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (sel_adc_we),
    .sram_data_i (sel_adc_sram_in),
    .data_o      (sel_adc_data_out)
  );
  assign sel_adc_sram_out = sel_adc_data_out;
  assign sel_adc_out_o    = sel_adc_data_out;

  // Data_adc[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    data_adc2(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (data_adc2_sram_out),
    .ana_data_i  (data_adc2_in_i)
  );

  // Data_adc[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    data_adc4(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (data_adc4_sram_out),
    .ana_data_i  (data_adc4_in_i)
  );



  always @(*) begin
    //----------Each Cell Write Enable Logic-------------
    // Default
    error_r = 1'b1;
    data_out = 16'h0;

    ram_addr_adc4_we = 1'b0;
    ram_addr_adc2_we = 1'b0;
    ram_addr_adc3_we = 1'b0;
    ram_addr_adc1_we = 1'b0;
    capture_start_we = 1'b0;
    sel_adc_we = 1'b0;


    if (valid_i == 1'b1 && we_i == 1'b1) begin
      case (addr_i)
        10'h002: begin
          capture_start_we = 1'b1;
          sel_adc_we = 1'b1;
          error_r = 1'b0;
        end
        10'h003: begin
          ram_addr_adc1_we = 1'b1;
          error_r = 1'b0;
        end
        10'h006: begin
          ram_addr_adc2_we = 1'b1;
          error_r = 1'b0;
        end
        10'h007: begin
          ram_addr_adc3_we = 1'b1;
          error_r = 1'b0;
        end
        10'h008: begin
          ram_addr_adc4_we = 1'b1;
          error_r = 1'b0;
        end
      endcase
    end

    //----------Each Cell Read Logic-------------
    // Default
    case (addr_i)
        10'h001: begin
          data_out[15:0] = CHIP_VER_sram_out;
          error_r = 1'b0;
        end
        10'h002: begin
          data_out[15:15] = capture_start_sram_out;
          data_out[14:14] = capture_ready_sram_out;
          data_out[1:0] = sel_adc_sram_out;
          error_r = 1'b0;
        end
        10'h003: begin
          data_out[15:0] = ram_addr_adc1_sram_out;
          error_r = 1'b0;
        end
        10'h004: begin
          data_out[15:0] = data_adc1_sram_out;
          error_r = 1'b0;
        end
        10'h005: begin
          data_out[15:0] = error_cnt_sram_out;
          error_r = 1'b0;
        end
        10'h006: begin
          data_out[15:0] = ram_addr_adc2_sram_out;
          error_r = 1'b0;
        end
        10'h007: begin
          data_out[15:0] = ram_addr_adc3_sram_out;
          error_r = 1'b0;
        end
        10'h008: begin
          data_out[15:0] = ram_addr_adc4_sram_out;
          error_r = 1'b0;
        end
        10'h009: begin
          data_out[15:0] = data_adc2_sram_out;
          error_r = 1'b0;
        end
        10'h00a: begin
          data_out[15:0] = data_adc3_sram_out;
          error_r = 1'b0;
        end
        10'h00b: begin
          data_out[15:0] = data_adc4_sram_out;
          error_r = 1'b0;
        end
    endcase
  end

  //----------Each Cell Write Logic-------------
  always @(*) begin
    ram_addr_adc4_sram_in = data_i[15:0];
    ram_addr_adc2_sram_in = data_i[15:0];
    ram_addr_adc3_sram_in = data_i[15:0];
    ram_addr_adc1_sram_in = data_i[15:0];
    capture_start_sram_in = data_i[15:15];
    sel_adc_sram_in = data_i[1:0];
  end

  //----------Each Cell Read Logic-------------
  assign valid_o = read_valid;
  assign error_o = error_r;

  //----------Register File Output Logic-------------
  assign data_o = data_out;

  always @(posedge clk_i or negedge rstb_i) begin
    if (rstb_i == 1'b0) begin
      read_valid_1 <= 1'b0;
      read_valid_2 <= 1'b0;
      read_valid   <= 1'b0;
    end else begin
      read_valid_1 <= (we_i == 1'b1) ? 1'b0 : valid_i;
      read_valid_2 <= read_valid_1;
      read_valid   <= read_valid_2;
    end
  end

endmodule
