module regmap_cell_wr(
  //-----SRAM Interface-------
  clk_i,       // Clock Input
  rstb_i,      // Reset Input
  we_i,        // Write Enable
  sram_data_i, // Data Input
  //-----Analog/SRAM Output Interface-------
  data_o       // Data Output
);

parameter DATA_WIDTH = 16;
parameter RST_VAL    = 0;

//----------Input Ports-------------
// SRAM Interface
input                  clk_i;
input                  rstb_i;
input                  we_i;
input [DATA_WIDTH-1:0] sram_data_i;

//----------Output Ports-------------
// SRAM and Ananlog use common output data
output [DATA_WIDTH-1:0] data_o;

//----------Internal Variables-------------
reg  [DATA_WIDTH-1:0] cell_data_reg;

//----------Code Start Here-------------
assign data_o = cell_data_reg;

always @(posedge clk_i or negedge rstb_i) begin
  if (rstb_i == 1'b0) begin
    cell_data_reg <= RST_VAL;
  end
  else begin
    if (we_i == 1'b1) begin
      cell_data_reg <= sram_data_i;
    end
  end
end

endmodule
