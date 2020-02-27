/* same address, but dig->ana and ana->dig are different path. */ 
module regmap_cell_rw(
  //-----SRAM Interface-------
  clk_i,       // Clock Input
  rstb_i,      // Reset Input
  we_i,        // Write Enable
  sram_data_i, // Data Input
  sram_data_o, // Data Output
  //-----Analog Interface-------
  ana_data_i,  // Data Input
  ana_data_o   // Data Output
);

parameter DATA_WIDTH = 16;
parameter RST_VAL    = 0;

//----------Input Ports-------------
// SRAM Interface
input                  clk_i;
input                  rstb_i;
input                  we_i;
input [DATA_WIDTH-1:0] sram_data_i;
// Analog Interface
input [DATA_WIDTH-1:0] ana_data_i;

//----------Output Ports-------------
// SRAM Interface
output [DATA_WIDTH-1:0] sram_data_o;
// Analog Interface
output [DATA_WIDTH-1:0] ana_data_o;

//----------Internal Variables-------------
reg  [DATA_WIDTH-1:0] ana_data_reg1;
reg  [DATA_WIDTH-1:0] ana_data_reg2;
reg  [DATA_WIDTH-1:0] cell_data_reg_wr;
reg  [DATA_WIDTH-1:0] cell_data_reg_rd;

//----------Code Start Here-------------
assign sram_data_o = cell_data_reg_rd;
assign ana_data_o  = cell_data_reg_wr;

always @(posedge clk_i) begin
  ana_data_reg1 <= ana_data_i;  
  ana_data_reg2 <= ana_data_reg1;
  cell_data_reg_rd <= ana_data_reg2;
end

always @(posedge clk_i or negedge rstb_i) begin
  if (rstb_i == 1'b0) begin
    cell_data_reg_wr <= RST_VAL;
  end
  else begin
    if (we_i == 1'b1) begin
      cell_data_reg_wr <= sram_data_i;
    end
  end
end

endmodule
