// auto_regfile
module auto_regfile (
  //-----Analog Interface IO-------
  input         io_send_done_in_i,
  output        io_send_mode_out_o,
  output [15:0] io_send_count_hign_out_o,
  output        io_suspend_out_o,
  output [15:0] io_send_count_low_out_o,
  output [15:0] io_etype_out_o,
  output        io_pkt_len_mode_out_o,
  input  [15:0] CHIP_VER_in_i,
  output [15:0] io_da_h_out_o,
  output [15:0] io_da_l_out_o,
  output [1:0] io_payload_mode_out_o,
  output [15:0] io_da_m_out_o,
  input  [15:0] io_total_send_count_l_in_i,
  input  [15:0] io_total_send_count_m_in_i,
  input  [15:0] io_total_send_count_h_in_i,
  output [15:0] io_sa_h_out_o,
  output [15:0] io_sa_m_out_o,
  output [15:0] io_sa_l_out_o,
  output        reset_out_o,
  output [15:0] io_inter_frame_gap_out_o,
  output        io_total_send_count_clr_out_o,
  output [15:0] io_pkt_len_init_out_o,
  output        io_enable_out_o,

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
  wire       io_send_done_sram_out;
  wire       io_send_done_data_out;

  reg        io_send_mode_we;
  reg        io_send_mode_sram_in;
  wire       io_send_mode_sram_out;
  wire       io_send_mode_data_out;

  reg        io_send_count_hign_we;
  reg  [15:0] io_send_count_hign_sram_in;
  wire [15:0] io_send_count_hign_sram_out;
  wire [15:0] io_send_count_hign_data_out;

  reg        io_suspend_we;
  reg        io_suspend_sram_in;
  wire       io_suspend_sram_out;
  wire       io_suspend_data_out;

  reg        io_send_count_low_we;
  reg  [15:0] io_send_count_low_sram_in;
  wire [15:0] io_send_count_low_sram_out;
  wire [15:0] io_send_count_low_data_out;

  reg        io_etype_we;
  reg  [15:0] io_etype_sram_in;
  wire [15:0] io_etype_sram_out;
  wire [15:0] io_etype_data_out;

  reg        io_pkt_len_mode_we;
  reg        io_pkt_len_mode_sram_in;
  wire       io_pkt_len_mode_sram_out;
  wire       io_pkt_len_mode_data_out;

  wire [15:0] CHIP_VER_sram_out;
  wire [15:0] CHIP_VER_data_out;

  reg        io_da_h_we;
  reg  [15:0] io_da_h_sram_in;
  wire [15:0] io_da_h_sram_out;
  wire [15:0] io_da_h_data_out;

  reg        io_da_l_we;
  reg  [15:0] io_da_l_sram_in;
  wire [15:0] io_da_l_sram_out;
  wire [15:0] io_da_l_data_out;

  reg        io_payload_mode_we;
  reg  [1:0] io_payload_mode_sram_in;
  wire [1:0] io_payload_mode_sram_out;
  wire [1:0] io_payload_mode_data_out;

  reg        io_da_m_we;
  reg  [15:0] io_da_m_sram_in;
  wire [15:0] io_da_m_sram_out;
  wire [15:0] io_da_m_data_out;

  wire [15:0] io_total_send_count_l_sram_out;
  wire [15:0] io_total_send_count_l_data_out;

  wire [15:0] io_total_send_count_m_sram_out;
  wire [15:0] io_total_send_count_m_data_out;

  wire [15:0] io_total_send_count_h_sram_out;
  wire [15:0] io_total_send_count_h_data_out;

  reg        io_sa_h_we;
  reg  [15:0] io_sa_h_sram_in;
  wire [15:0] io_sa_h_sram_out;
  wire [15:0] io_sa_h_data_out;

  reg        io_sa_m_we;
  reg  [15:0] io_sa_m_sram_in;
  wire [15:0] io_sa_m_sram_out;
  wire [15:0] io_sa_m_data_out;

  reg        io_sa_l_we;
  reg  [15:0] io_sa_l_sram_in;
  wire [15:0] io_sa_l_sram_out;
  wire [15:0] io_sa_l_data_out;

  reg        reset_we;
  reg        reset_sram_in;
  wire       reset_sram_out;
  wire       reset_data_out;

  reg        io_inter_frame_gap_we;
  reg  [15:0] io_inter_frame_gap_sram_in;
  wire [15:0] io_inter_frame_gap_sram_out;
  wire [15:0] io_inter_frame_gap_data_out;

  reg        io_total_send_count_clr_we;
  reg        io_total_send_count_clr_sram_in;
  wire       io_total_send_count_clr_sram_out;
  wire       io_total_send_count_clr_data_out;

  reg        io_pkt_len_init_we;
  reg  [15:0] io_pkt_len_init_sram_in;
  wire [15:0] io_pkt_len_init_sram_out;
  wire [15:0] io_pkt_len_init_data_out;

  reg        io_enable_we;
  reg        io_enable_sram_in;
  wire       io_enable_sram_out;
  wire       io_enable_data_out;



  //---------- Register Instantiation-------------
  // 
  regmap_cell_rd #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_send_done(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (io_send_done_sram_out),
    .ana_data_i  (io_send_done_in_i)
  );

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_send_mode(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_send_mode_we),
    .sram_data_i (io_send_mode_sram_in),
    .data_o      (io_send_mode_data_out)
  );
  assign io_send_mode_sram_out = io_send_mode_data_out;
  assign io_send_mode_out_o    = io_send_mode_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_send_count_hign(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_send_count_hign_we),
    .sram_data_i (io_send_count_hign_sram_in),
    .data_o      (io_send_count_hign_data_out)
  );
  assign io_send_count_hign_sram_out = io_send_count_hign_data_out;
  assign io_send_count_hign_out_o    = io_send_count_hign_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_suspend(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_suspend_we),
    .sram_data_i (io_suspend_sram_in),
    .data_o      (io_suspend_data_out)
  );
  assign io_suspend_sram_out = io_suspend_data_out;
  assign io_suspend_out_o    = io_suspend_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_send_count_low(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_send_count_low_we),
    .sram_data_i (io_send_count_low_sram_in),
    .data_o      (io_send_count_low_data_out)
  );
  assign io_send_count_low_sram_out = io_send_count_low_data_out;
  assign io_send_count_low_out_o    = io_send_count_low_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_etype(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_etype_we),
    .sram_data_i (io_etype_sram_in),
    .data_o      (io_etype_data_out)
  );
  assign io_etype_sram_out = io_etype_data_out;
  assign io_etype_out_o    = io_etype_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_pkt_len_mode(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_pkt_len_mode_we),
    .sram_data_i (io_pkt_len_mode_sram_in),
    .data_o      (io_pkt_len_mode_data_out)
  );
  assign io_pkt_len_mode_sram_out = io_pkt_len_mode_data_out;
  assign io_pkt_len_mode_out_o    = io_pkt_len_mode_data_out;

  // 
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'hbeef))
    CHIP_VER(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (CHIP_VER_sram_out),
    .ana_data_i  (CHIP_VER_in_i)
  );

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_da_h(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_da_h_we),
    .sram_data_i (io_da_h_sram_in),
    .data_o      (io_da_h_data_out)
  );
  assign io_da_h_sram_out = io_da_h_data_out;
  assign io_da_h_out_o    = io_da_h_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_da_l(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_da_l_we),
    .sram_data_i (io_da_l_sram_in),
    .data_o      (io_da_l_data_out)
  );
  assign io_da_l_sram_out = io_da_l_data_out;
  assign io_da_l_out_o    = io_da_l_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(2), .RST_VAL(2'h0))
    io_payload_mode(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_payload_mode_we),
    .sram_data_i (io_payload_mode_sram_in),
    .data_o      (io_payload_mode_data_out)
  );
  assign io_payload_mode_sram_out = io_payload_mode_data_out;
  assign io_payload_mode_out_o    = io_payload_mode_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_da_m(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_da_m_we),
    .sram_data_i (io_da_m_sram_in),
    .data_o      (io_da_m_data_out)
  );
  assign io_da_m_sram_out = io_da_m_data_out;
  assign io_da_m_out_o    = io_da_m_data_out;

  // Addr[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_total_send_count_l(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (io_total_send_count_l_sram_out),
    .ana_data_i  (io_total_send_count_l_in_i)
  );

  // Addr[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_total_send_count_m(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (io_total_send_count_m_sram_out),
    .ana_data_i  (io_total_send_count_m_in_i)
  );

  // Addr[15:0]
  regmap_cell_rd #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_total_send_count_h(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .sram_data_o (io_total_send_count_h_sram_out),
    .ana_data_i  (io_total_send_count_h_in_i)
  );

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_sa_h(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_sa_h_we),
    .sram_data_i (io_sa_h_sram_in),
    .data_o      (io_sa_h_data_out)
  );
  assign io_sa_h_sram_out = io_sa_h_data_out;
  assign io_sa_h_out_o    = io_sa_h_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_sa_m(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_sa_m_we),
    .sram_data_i (io_sa_m_sram_in),
    .data_o      (io_sa_m_data_out)
  );
  assign io_sa_m_sram_out = io_sa_m_data_out;
  assign io_sa_m_out_o    = io_sa_m_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_sa_l(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_sa_l_we),
    .sram_data_i (io_sa_l_sram_in),
    .data_o      (io_sa_l_data_out)
  );
  assign io_sa_l_sram_out = io_sa_l_data_out;
  assign io_sa_l_out_o    = io_sa_l_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    reset(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (reset_we),
    .sram_data_i (reset_sram_in),
    .data_o      (reset_data_out)
  );
  assign reset_sram_out = reset_data_out;
  assign reset_out_o    = reset_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_inter_frame_gap(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_inter_frame_gap_we),
    .sram_data_i (io_inter_frame_gap_sram_in),
    .data_o      (io_inter_frame_gap_data_out)
  );
  assign io_inter_frame_gap_sram_out = io_inter_frame_gap_data_out;
  assign io_inter_frame_gap_out_o    = io_inter_frame_gap_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_total_send_count_clr(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_total_send_count_clr_we),
    .sram_data_i (io_total_send_count_clr_sram_in),
    .data_o      (io_total_send_count_clr_data_out)
  );
  assign io_total_send_count_clr_sram_out = io_total_send_count_clr_data_out;
  assign io_total_send_count_clr_out_o    = io_total_send_count_clr_data_out;

  // Addr[15:0]
  regmap_cell_wr #(.DATA_WIDTH(16), .RST_VAL(16'h0))
    io_pkt_len_init(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_pkt_len_init_we),
    .sram_data_i (io_pkt_len_init_sram_in),
    .data_o      (io_pkt_len_init_data_out)
  );
  assign io_pkt_len_init_sram_out = io_pkt_len_init_data_out;
  assign io_pkt_len_init_out_o    = io_pkt_len_init_data_out;

  // 
  regmap_cell_wr #(.DATA_WIDTH(1), .RST_VAL(1'h0))
    io_enable(
    .clk_i       (clk_i),
    .rstb_i      (rstb_i),
    .we_i        (io_enable_we),
    .sram_data_i (io_enable_sram_in),
    .data_o      (io_enable_data_out)
  );
  assign io_enable_sram_out = io_enable_data_out;
  assign io_enable_out_o    = io_enable_data_out;



  always @(*) begin
    //----------Each Cell Write Enable Logic-------------
    // Default
    error_r = 1'b1;
    data_out = 16'h0;

    io_send_mode_we = 1'b0;
    io_send_count_hign_we = 1'b0;
    io_suspend_we = 1'b0;
    io_send_count_low_we = 1'b0;
    io_etype_we = 1'b0;
    io_pkt_len_mode_we = 1'b0;
    io_da_h_we = 1'b0;
    io_da_l_we = 1'b0;
    io_payload_mode_we = 1'b0;
    io_da_m_we = 1'b0;
    io_sa_h_we = 1'b0;
    io_sa_m_we = 1'b0;
    io_sa_l_we = 1'b0;
    reset_we = 1'b0;
    io_inter_frame_gap_we = 1'b0;
    io_total_send_count_clr_we = 1'b0;
    io_pkt_len_init_we = 1'b0;
    io_enable_we = 1'b0;


    if (valid_i == 1'b1 && we_i == 1'b1) begin
      case (addr_i)
        10'h002: begin
          io_enable_we = 1'b1;
          io_suspend_we = 1'b1;
          io_send_mode_we = 1'b1;
          io_pkt_len_mode_we = 1'b1;
          io_payload_mode_we = 1'b1;
          reset_we = 1'b1;
          io_total_send_count_clr_we = 1'b1;
          error_r = 1'b0;
        end
        10'h003: begin
          io_send_count_low_we = 1'b1;
          error_r = 1'b0;
        end
        10'h004: begin
          io_send_count_hign_we = 1'b1;
          error_r = 1'b0;
        end
        10'h005: begin
          io_pkt_len_init_we = 1'b1;
          error_r = 1'b0;
        end
        10'h006: begin
          io_inter_frame_gap_we = 1'b1;
          error_r = 1'b0;
        end
        10'h007: begin
          io_da_l_we = 1'b1;
          error_r = 1'b0;
        end
        10'h008: begin
          io_da_m_we = 1'b1;
          error_r = 1'b0;
        end
        10'h009: begin
          io_da_h_we = 1'b1;
          error_r = 1'b0;
        end
        10'h00a: begin
          io_sa_l_we = 1'b1;
          error_r = 1'b0;
        end
        10'h00b: begin
          io_sa_m_we = 1'b1;
          error_r = 1'b0;
        end
        10'h00c: begin
          io_sa_h_we = 1'b1;
          error_r = 1'b0;
        end
        10'h00d: begin
          io_etype_we = 1'b1;
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
          data_out[15:15] = io_enable_sram_out;
          data_out[14:14] = io_suspend_sram_out;
          data_out[13:13] = io_send_mode_sram_out;
          data_out[12:12] = io_send_done_sram_out;
          data_out[11:11] = io_pkt_len_mode_sram_out;
          data_out[10:9] = io_payload_mode_sram_out;
          data_out[8:8] = reset_sram_out;
          data_out[7:7] = io_total_send_count_clr_sram_out;
          error_r = 1'b0;
        end
        10'h003: begin
          data_out[15:0] = io_send_count_low_sram_out;
          error_r = 1'b0;
        end
        10'h004: begin
          data_out[15:0] = io_send_count_hign_sram_out;
          error_r = 1'b0;
        end
        10'h005: begin
          data_out[15:0] = io_pkt_len_init_sram_out;
          error_r = 1'b0;
        end
        10'h006: begin
          data_out[15:0] = io_inter_frame_gap_sram_out;
          error_r = 1'b0;
        end
        10'h007: begin
          data_out[15:0] = io_da_l_sram_out;
          error_r = 1'b0;
        end
        10'h008: begin
          data_out[15:0] = io_da_m_sram_out;
          error_r = 1'b0;
        end
        10'h009: begin
          data_out[15:0] = io_da_h_sram_out;
          error_r = 1'b0;
        end
        10'h00a: begin
          data_out[15:0] = io_sa_l_sram_out;
          error_r = 1'b0;
        end
        10'h00b: begin
          data_out[15:0] = io_sa_m_sram_out;
          error_r = 1'b0;
        end
        10'h00c: begin
          data_out[15:0] = io_sa_h_sram_out;
          error_r = 1'b0;
        end
        10'h00d: begin
          data_out[15:0] = io_etype_sram_out;
          error_r = 1'b0;
        end
        10'h00f: begin
          data_out[15:0] = io_total_send_count_l_sram_out;
          error_r = 1'b0;
        end
        10'h010: begin
          data_out[15:0] = io_total_send_count_m_sram_out;
          error_r = 1'b0;
        end
        10'h011: begin
          data_out[15:0] = io_total_send_count_h_sram_out;
          error_r = 1'b0;
        end
    endcase
  end

  //----------Each Cell Write Logic-------------
  always @(*) begin
    io_send_mode_sram_in = data_i[13:13];
    io_send_count_hign_sram_in = data_i[15:0];
    io_suspend_sram_in = data_i[14:14];
    io_send_count_low_sram_in = data_i[15:0];
    io_etype_sram_in = data_i[15:0];
    io_pkt_len_mode_sram_in = data_i[11:11];
    io_da_h_sram_in = data_i[15:0];
    io_da_l_sram_in = data_i[15:0];
    io_payload_mode_sram_in = data_i[10:9];
    io_da_m_sram_in = data_i[15:0];
    io_sa_h_sram_in = data_i[15:0];
    io_sa_m_sram_in = data_i[15:0];
    io_sa_l_sram_in = data_i[15:0];
    reset_sram_in = data_i[8:8];
    io_inter_frame_gap_sram_in = data_i[15:0];
    io_total_send_count_clr_sram_in = data_i[7:7];
    io_pkt_len_init_sram_in = data_i[15:0];
    io_enable_sram_in = data_i[15:15];
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
