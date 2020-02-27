module regmap_cell_rd(
  //-----SRAM Interface-------
  clk_i,       // Clock Input
  rstb_i,      // Reset Input
  sram_data_o, // Data Output
  //-----Analog Interface-------
  ana_data_i   // Data Input
);

parameter DATA_WIDTH = 16;
parameter RST_VAL    = 0;

//----------Input Ports-------------
// SRAM Interface
input                  clk_i;
input                  rstb_i;
// Analog Interface
input [DATA_WIDTH-1:0] ana_data_i;

//----------Output Ports-------------
// SRAM Interface
output [DATA_WIDTH-1:0] sram_data_o;

//----------Internal Variables-------------
reg  [DATA_WIDTH-1:0] ana_data_reg1;
reg  [DATA_WIDTH-1:0] ana_data_reg2;
reg  [DATA_WIDTH-1:0] cell_data_reg;


//----------Code Start Here-------------
assign sram_data_o = cell_data_reg;

always @(posedge clk_i) begin
  ana_data_reg1 <= ana_data_i;  
  ana_data_reg2 <= ana_data_reg1;
  cell_data_reg <= ana_data_reg2;
end
  
endmodule
