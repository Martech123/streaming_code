/*
 * protocol:
 * 
 * | op(3) | adr (10) | xfer(3) | dat(16) |
 *
 * CPOL = 0 CPHA = 1
 */

// Define Operators
`define OP_READ  3'b100
`define OP_WRITE 3'b110
// Define Width
`define OP_W   3
`define ADR_W  10
`define DAT_W  16
`define CNTR_W 6
 // Define Protocol Clocks
`define OP_CLOCKS         `CNTR_W'd3
`define ADR_CLOCKS        `CNTR_W'd13
`define XFER_BEGIN_CLOCKS `CNTR_W'd14
`define XFER_END_CLOCKS   `CNTR_W'd16
`define BUSY_READ_BEGIN   `CNTR_W'd7  // 13 - 6 = 7
`define BUSY_READ_END     `CNTR_W'd17 // 13 + 4 = 17
`define BUSY_WRITE_BEGIN  `CNTR_W'd25 // 31 - 6 = 25
`define BUSY_WRITE_END    `CNTR_W'd32 // 31 + 1 = 32

module spi_slave (
  input               rstb_i,
  // SPI Interface
  input               sclk_i,
  input               mosi_i,
  input               cs_i,
  output              miso_o,
  // Register Interface
  input  [`DAT_W-1:0] rdata_i,
  output              clk_o,
  output              ce_o,
  output              we_o,
  output [`ADR_W-1:0] addr_o,
  output [`DAT_W-1:0] wdata_o,
  output              busy_o
);

reg               rgate_r;
reg               wgate_r;
reg [`OP_W-1:0]   op_r;
reg [`DAT_W-1:0]  rdata_r;
reg [`CNTR_W-1:0] cntr_r;
reg [31:0 ]       inner_data_r;

// Output to Regfile
reg              rce_r;
reg [`ADR_W-1:0] addr_r;
reg              busy_r;

wire resetb;

wire read_period;
wire write_period;

assign dbg_spi_slv_cs_o = cs_i;
assign dbg_spi_slv_sclk_o = sclk_i;
assign dbg_spi_slv_mosi_o = mosi_i;
assign dbg_spi_slv_miso_o = miso_o;

// Reset Logic
assign resetb = (~cs_i) & rstb_i;

// Shift(Read) all mosi data and generate other control signals.
always @(negedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    inner_data_r <= 32'h0;
  end
  else begin
    if (cntr_r <= `CNTR_W'd31)
      inner_data_r <= {inner_data_r[30:0], mosi_i};
  end
end

// Latch OpCode and Address
always @(negedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    op_r   <= 3'h0;
    addr_r <= 10'h0;
  end
  else begin
    if (cntr_r == `OP_CLOCKS) begin
      op_r   <= {inner_data_r[1:0], mosi_i};
    end
    if (cntr_r == `ADR_CLOCKS) begin
      addr_r <= {inner_data_r[8:0], mosi_i};
    end
  end
end

// Latch Read Data from RegFile and shift MSB to miso_o
always @(posedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    rdata_r   <= 16'hffff;
  end
  else begin
    if (cntr_r == `CNTR_W'd16 && op_r == `OP_READ) begin
      rdata_r <= rdata_i;
    end
    else if (cntr_r > `CNTR_W'd16) begin
      rdata_r <= {rdata_r[`DAT_W-2:0], rdata_r[`DAT_W-1]};
    end
  end
end

// Busy Logic
always @(posedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    busy_r <= 1'b0;
  end
  else begin
    if (op_r == `OP_READ && (cntr_r >= `BUSY_READ_BEGIN && cntr_r <= `BUSY_READ_END)) begin
      busy_r <= 1'b1;
    end
    else if (op_r == `OP_WRITE && (cntr_r >= `BUSY_WRITE_BEGIN && cntr_r <= `BUSY_WRITE_END)) begin
      busy_r <= 1'b1;
    end
    else begin
      busy_r <= 1'b0;
    end
  end
end

// counter of cycles
always @(posedge sclk_i or negedge resetb)
  if (resetb == 1'b0)
    cntr_r <= {`CNTR_W{1'b0}};
  else
    cntr_r <= cntr_r + 1;

assign read_period = (op_r == `OP_READ) &&
                     (cntr_r >= (`XFER_BEGIN_CLOCKS-1) &&
                      cntr_r <= (`XFER_END_CLOCKS));
assign write_period = op_r == `OP_WRITE && (cntr_r >= 'd31 && cntr_r <= 'd32);

always @(posedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    rgate_r <= 1'b0;
  end
  else begin
    rgate_r <= read_period;
  end
end

always @(posedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    wgate_r <= 1'b0;
  end
  else begin
    wgate_r <= write_period;
  end
end


// RegFile Write Enable and Chip Enable Logic
always @(posedge sclk_i or negedge resetb) begin
  if (resetb == 1'b0) begin
    rce_r <= 1'b0;
  end
  else  begin
    if (cntr_r == `ADR_CLOCKS && op_r == `OP_READ) begin
      rce_r <= 1'b1;
    end
    else if (cntr_r == `CNTR_W'd31 && op_r == `OP_WRITE) begin
      rce_r <= 1'b1;
    end
    else begin
      rce_r <= 1'b0;
    end
  end
end

assign miso_o = (cntr_r >= 17) ? rdata_r[`DAT_W-1] : 1'b1;

assign clk_o   = (~sclk_i) & (wgate_r || rgate_r);

assign ce_o    = (op_r == `OP_WRITE) ? wgate_r : rce_r;
assign we_o    = wgate_r;
assign addr_o  = addr_r;
assign wdata_o = {inner_data_r[14:0], mosi_i};
assign busy_o  = busy_r;

endmodule
