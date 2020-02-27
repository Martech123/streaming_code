# vc707 pinout
# XC7VX485T-2FFG1761 FPGA
#--------------------Timing Constraints-----------------
#ADC
create_clock -period 8.000 -name ADC1_DCOP -waveform {0.000 4.000} [get_ports ADC1_DCOP]
create_clock -period 8.000 -name ADC2_DCOP -waveform {0.000 4.000} [get_ports ADC2_DCOP]
create_clock -period 8.000 -name ADC3_DCOP -waveform {0.000 4.000} [get_ports ADC3_DCOP]
create_clock -period 8.000 -name ADC4_DCOP -waveform {0.000 4.000} [get_ports ADC4_DCOP]

# DAC
create_clock -period 16.000 -name DAC1_DCKOP -waveform {0.000 8.000} [get_ports DAC1_DCKOP]
create_clock -period 16.000 -name DAC2_DCKOP -waveform {0.000 8.000} [get_ports DAC2_DCKOP]
create_clock -period 16.000 -name DAC3_DCKOP -waveform {0.000 8.000} [get_ports DAC3_DCKOP]
create_clock -period 16.000 -name DAC4_DCKOP -waveform {0.000 8.000} [get_ports DAC4_DCKOP]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets FMC_IO_30_IBUF]
create_clock -period 50.000 -name FMC_IO_30 -waveform {0.000 25.000} [get_ports FMC_IO_30]

set_false_path -from [get_clocks DAC1_DCKOP] -to [get_clocks DAC2_DCKOP]
set_false_path -from [get_clocks DAC1_DCKOP] -to [get_clocks DAC3_DCKOP]
set_false_path -from [get_clocks DAC1_DCKOP] -to [get_clocks DAC4_DCKOP]

set_false_path -from [get_clocks DAC2_DCKOP] -to [get_clocks DAC1_DCKOP]
set_false_path -from [get_clocks DAC2_DCKOP] -to [get_clocks DAC3_DCKOP]
set_false_path -from [get_clocks DAC2_DCKOP] -to [get_clocks DAC4_DCKOP]

set_false_path -from [get_clocks DAC3_DCKOP] -to [get_clocks DAC1_DCKOP]
set_false_path -from [get_clocks DAC3_DCKOP] -to [get_clocks DAC2_DCKOP]
set_false_path -from [get_clocks DAC3_DCKOP] -to [get_clocks DAC4_DCKOP]

set_false_path -from [get_clocks DAC4_DCKOP] -to [get_clocks DAC1_DCKOP]
set_false_path -from [get_clocks DAC4_DCKOP] -to [get_clocks DAC2_DCKOP]
set_false_path -from [get_clocks DAC4_DCKOP] -to [get_clocks DAC3_DCKOP]

set_false_path -from [get_clocks FMC_IO_30] -to [get_clocks ADC1_DCOP]
set_false_path -from [get_clocks FMC_IO_30] -to [get_clocks ADC2_DCOP]
set_false_path -from [get_clocks FMC_IO_30] -to [get_clocks ADC3_DCOP]
set_false_path -from [get_clocks FMC_IO_30] -to [get_clocks ADC4_DCOP]

set_false_path -from [get_clocks ADC1_DCOP] -to [get_clocks FMC_IO_30]
set_false_path -from [get_clocks ADC2_DCOP] -to [get_clocks FMC_IO_30]
set_false_path -from [get_clocks ADC3_DCOP] -to [get_clocks FMC_IO_30]
set_false_path -from [get_clocks ADC4_DCOP] -to [get_clocks FMC_IO_30]



# set timing constrain
set_input_delay -clock [get_clocks ADC1_DCOP] -min -add_delay 3.000 [get_ports {ADC1_DA[*]}]
set_input_delay -clock [get_clocks ADC1_DCOP] -max -add_delay 5.000 [get_ports {ADC1_DA[*]}]
set_input_delay -clock [get_clocks ADC1_DCOP] -clock_fall -min -add_delay 3.000 [get_ports {ADC1_DB[*]}]
set_input_delay -clock [get_clocks ADC1_DCOP] -clock_fall -max -add_delay 5.000 [get_ports {ADC1_DB[*]}]
set_input_delay -clock [get_clocks ADC2_DCOP] -min -add_delay 3.000 [get_ports {ADC2_DA[*]}]
set_input_delay -clock [get_clocks ADC2_DCOP] -max -add_delay 5.000 [get_ports {ADC2_DA[*]}]
set_input_delay -clock [get_clocks ADC2_DCOP] -clock_fall -min -add_delay 3.000 [get_ports {ADC2_DB[*]}]
set_input_delay -clock [get_clocks ADC2_DCOP] -clock_fall -max -add_delay 5.000 [get_ports {ADC2_DB[*]}]
set_input_delay -clock [get_clocks ADC3_DCOP] -min -add_delay 3.000 [get_ports {ADC3_DA[*]}]
set_input_delay -clock [get_clocks ADC3_DCOP] -max -add_delay 5.000 [get_ports {ADC3_DA[*]}]
set_input_delay -clock [get_clocks ADC3_DCOP] -clock_fall -min -add_delay 3.000 [get_ports {ADC3_DB[*]}]
set_input_delay -clock [get_clocks ADC3_DCOP] -clock_fall -max -add_delay 5.000 [get_ports {ADC3_DB[*]}]
set_input_delay -clock [get_clocks ADC4_DCOP] -min -add_delay 3.000 [get_ports {ADC4_DA[*]}]
set_input_delay -clock [get_clocks ADC4_DCOP] -max -add_delay 5.000 [get_ports {ADC4_DA[*]}]
set_input_delay -clock [get_clocks ADC4_DCOP] -clock_fall -min -add_delay 3.000 [get_ports {ADC4_DB[*]}]
set_input_delay -clock [get_clocks ADC4_DCOP] -clock_fall -max -add_delay 5.000 [get_ports {ADC4_DB[*]}]

# PCIE Timing Constraints
create_clock -period 10.000 -name pcie_refclk [get_pins PCIE_top/PCIE_if/refclk_ibuf/O]

#
# SYS clock 100 MHz (input) signal. The sys_clk_p and sys_clk_n
# signals are the PCI Express reference clock. Virtex-7 GT
# Transceiver architecture requires the use of a dedicated clock
# resources (FPGA input pins) associated with each GT Transceiver.
# To use these pins an IBUFDS primitive (refclk_ibuf) is
# instantiated in user's design.
# Please refer to the Virtex-7 GT Transceiver User Guide
# (UG) for guidelines regarding clock resource selection.
#
set_property LOC IBUFDS_GTE2_X1Y5 [get_cells PCIE_top/PCIE_if/refclk_ibuf]

# Physical Constraints
set_false_path -to [get_ports -filter NAME=~LED_PCIE*]
set_false_path -from [get_ports PCIE_RESET_N]


set_false_path -from [get_clocks -of_objects [get_pins PCIE_top/PCIE_if/PCIeGen2x8If128_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/mmcm_i/CLKOUT3]] -to [get_clocks -of_objects [get_pins PCIE_top/BUFR_div2/O]]









set_input_delay -clock [get_clocks FMC_IO_30] -clock_fall -min -add_delay 4.000 [get_ports FMC_IO_29]
set_input_delay -clock [get_clocks FMC_IO_30] -clock_fall -max -add_delay 6.000 [get_ports FMC_IO_29]
set_input_delay -clock [get_clocks FMC_IO_30] -clock_fall -min -add_delay 3.000 [get_ports FMC_IO_31]
set_input_delay -clock [get_clocks FMC_IO_30] -clock_fall -max -add_delay 5.000 [get_ports FMC_IO_31]
set_input_delay -clock [get_clocks FMC_IO_30] -min -add_delay 3.000 [get_ports FMC_IO_31]
set_input_delay -clock [get_clocks FMC_IO_30] -max -add_delay 5.000 [get_ports FMC_IO_31]



create_clock -period 8.000 -name PCIE_REFCLK_P -waveform {0.000 4.000} [get_ports PCIE_REFCLK_P]
#create_generated_clock -name clk_250mhz_Gen -source [get_pins PCIE_top/PCIE_if/PCIeGen2x8If128_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/I1] -divide_by 1 -add -master_clock clk_250mhz [get_pins PCIE_top/PCIE_if/PCIeGen2x8If128_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_clock_int.pipe_clock_i/pclk_i1_bufgctrl.pclk_i1/O]
#set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks clk_125mhz_mux_x1y0] -group [get_clocks -include_generated_clocks clk_250mhz_Gen]

#set_clock_groups -asynchronous -group [get_clocks ADC_DCLKI_div2] -group [get_clocks userclk2]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ADC1_DCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {debug/chan_adc_data1[0]} {debug/chan_adc_data1[1]} {debug/chan_adc_data1[2]} {debug/chan_adc_data1[3]} {debug/chan_adc_data1[4]} {debug/chan_adc_data1[5]} {debug/chan_adc_data1[6]} {debug/chan_adc_data1[7]} {debug/chan_adc_data1[8]} {debug/chan_adc_data1[9]} {debug/chan_adc_data1[10]} {debug/chan_adc_data1[11]} {debug/chan_adc_data1[12]} {debug/chan_adc_data1[13]} {debug/chan_adc_data1[14]} {debug/chan_adc_data1[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {debug/spi_capture_adc1/mem_dina[0]} {debug/spi_capture_adc1/mem_dina[1]} {debug/spi_capture_adc1/mem_dina[2]} {debug/spi_capture_adc1/mem_dina[3]} {debug/spi_capture_adc1/mem_dina[4]} {debug/spi_capture_adc1/mem_dina[5]} {debug/spi_capture_adc1/mem_dina[6]} {debug/spi_capture_adc1/mem_dina[7]} {debug/spi_capture_adc1/mem_dina[8]} {debug/spi_capture_adc1/mem_dina[9]} {debug/spi_capture_adc1/mem_dina[10]} {debug/spi_capture_adc1/mem_dina[11]} {debug/spi_capture_adc1/mem_dina[12]} {debug/spi_capture_adc1/mem_dina[13]} {debug/spi_capture_adc1/mem_dina[14]} {debug/spi_capture_adc1/mem_dina[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 15 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {debug/spi_capture_adc1/mem_addra[0]} {debug/spi_capture_adc1/mem_addra[1]} {debug/spi_capture_adc1/mem_addra[2]} {debug/spi_capture_adc1/mem_addra[3]} {debug/spi_capture_adc1/mem_addra[4]} {debug/spi_capture_adc1/mem_addra[5]} {debug/spi_capture_adc1/mem_addra[6]} {debug/spi_capture_adc1/mem_addra[7]} {debug/spi_capture_adc1/mem_addra[8]} {debug/spi_capture_adc1/mem_addra[9]} {debug/spi_capture_adc1/mem_addra[10]} {debug/spi_capture_adc1/mem_addra[11]} {debug/spi_capture_adc1/mem_addra[12]} {debug/spi_capture_adc1/mem_addra[13]} {debug/spi_capture_adc1/mem_addra[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {adc_if/adc1/ADC_DI_r[0]} {adc_if/adc1/ADC_DI_r[1]} {adc_if/adc1/ADC_DI_r[2]} {adc_if/adc1/ADC_DI_r[3]} {adc_if/adc1/ADC_DI_r[4]} {adc_if/adc1/ADC_DI_r[5]} {adc_if/adc1/ADC_DI_r[6]} {adc_if/adc1/ADC_DI_r[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {adc_if/adc1/ADC_DQ_r[0]} {adc_if/adc1/ADC_DQ_r[1]} {adc_if/adc1/ADC_DQ_r[2]} {adc_if/adc1/ADC_DQ_r[3]} {adc_if/adc1/ADC_DQ_r[4]} {adc_if/adc1/ADC_DQ_r[5]} {adc_if/adc1/ADC_DQ_r[6]} {adc_if/adc1/ADC_DQ_r[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {ADC1_DA_IBUF[0]} {ADC1_DA_IBUF[1]} {ADC1_DA_IBUF[2]} {ADC1_DA_IBUF[3]} {ADC1_DA_IBUF[4]} {ADC1_DA_IBUF[5]} {ADC1_DA_IBUF[6]} {ADC1_DA_IBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {ADC1_DB_IBUF[0]} {ADC1_DB_IBUF[1]} {ADC1_DB_IBUF[2]} {ADC1_DB_IBUF[3]} {ADC1_DB_IBUF[4]} {ADC1_DB_IBUF[5]} {ADC1_DB_IBUF[6]} {ADC1_DB_IBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {adc1_d_o[0]} {adc1_d_o[1]} {adc1_d_o[2]} {adc1_d_o[3]} {adc1_d_o[4]} {adc1_d_o[5]} {adc1_d_o[6]} {adc1_d_o[7]} {adc1_d_o[8]} {adc1_d_o[9]} {adc1_d_o[10]} {adc1_d_o[11]} {adc1_d_o[12]} {adc1_d_o[13]} {adc1_d_o[14]} {adc1_d_o[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 16 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {debug/spi_capture_adc1/MemBram_dina[0]} {debug/spi_capture_adc1/MemBram_dina[1]} {debug/spi_capture_adc1/MemBram_dina[2]} {debug/spi_capture_adc1/MemBram_dina[3]} {debug/spi_capture_adc1/MemBram_dina[4]} {debug/spi_capture_adc1/MemBram_dina[5]} {debug/spi_capture_adc1/MemBram_dina[6]} {debug/spi_capture_adc1/MemBram_dina[7]} {debug/spi_capture_adc1/MemBram_dina[8]} {debug/spi_capture_adc1/MemBram_dina[9]} {debug/spi_capture_adc1/MemBram_dina[10]} {debug/spi_capture_adc1/MemBram_dina[11]} {debug/spi_capture_adc1/MemBram_dina[12]} {debug/spi_capture_adc1/MemBram_dina[13]} {debug/spi_capture_adc1/MemBram_dina[14]} {debug/spi_capture_adc1/MemBram_dina[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {debug/spi_capture_adc1/io_chan_adc_data1[0]} {debug/spi_capture_adc1/io_chan_adc_data1[1]} {debug/spi_capture_adc1/io_chan_adc_data1[2]} {debug/spi_capture_adc1/io_chan_adc_data1[3]} {debug/spi_capture_adc1/io_chan_adc_data1[4]} {debug/spi_capture_adc1/io_chan_adc_data1[5]} {debug/spi_capture_adc1/io_chan_adc_data1[6]} {debug/spi_capture_adc1/io_chan_adc_data1[7]} {debug/spi_capture_adc1/io_chan_adc_data1[8]} {debug/spi_capture_adc1/io_chan_adc_data1[9]} {debug/spi_capture_adc1/io_chan_adc_data1[10]} {debug/spi_capture_adc1/io_chan_adc_data1[11]} {debug/spi_capture_adc1/io_chan_adc_data1[12]} {debug/spi_capture_adc1/io_chan_adc_data1[13]} {debug/spi_capture_adc1/io_chan_adc_data1[14]} {debug/spi_capture_adc1/io_chan_adc_data1[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 15 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {debug/spi_capture_adc1/MemBram_addra[0]} {debug/spi_capture_adc1/MemBram_addra[1]} {debug/spi_capture_adc1/MemBram_addra[2]} {debug/spi_capture_adc1/MemBram_addra[3]} {debug/spi_capture_adc1/MemBram_addra[4]} {debug/spi_capture_adc1/MemBram_addra[5]} {debug/spi_capture_adc1/MemBram_addra[6]} {debug/spi_capture_adc1/MemBram_addra[7]} {debug/spi_capture_adc1/MemBram_addra[8]} {debug/spi_capture_adc1/MemBram_addra[9]} {debug/spi_capture_adc1/MemBram_addra[10]} {debug/spi_capture_adc1/MemBram_addra[11]} {debug/spi_capture_adc1/MemBram_addra[12]} {debug/spi_capture_adc1/MemBram_addra[13]} {debug/spi_capture_adc1/MemBram_addra[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list debug/spi_capture_adc1/MemBram_clka]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list debug/spi_capture_adc1/MemBram_ena]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list debug/spi_capture_adc1/MemBram_enb]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list debug/spi_capture_adc1/MemBram_wea]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list ADC2_DCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 16 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {debug/chan_adc_data2[0]} {debug/chan_adc_data2[1]} {debug/chan_adc_data2[2]} {debug/chan_adc_data2[3]} {debug/chan_adc_data2[4]} {debug/chan_adc_data2[5]} {debug/chan_adc_data2[6]} {debug/chan_adc_data2[7]} {debug/chan_adc_data2[8]} {debug/chan_adc_data2[9]} {debug/chan_adc_data2[10]} {debug/chan_adc_data2[11]} {debug/chan_adc_data2[12]} {debug/chan_adc_data2[13]} {debug/chan_adc_data2[14]} {debug/chan_adc_data2[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 16 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {debug/spi_capture_adc2/mem_dina[0]} {debug/spi_capture_adc2/mem_dina[1]} {debug/spi_capture_adc2/mem_dina[2]} {debug/spi_capture_adc2/mem_dina[3]} {debug/spi_capture_adc2/mem_dina[4]} {debug/spi_capture_adc2/mem_dina[5]} {debug/spi_capture_adc2/mem_dina[6]} {debug/spi_capture_adc2/mem_dina[7]} {debug/spi_capture_adc2/mem_dina[8]} {debug/spi_capture_adc2/mem_dina[9]} {debug/spi_capture_adc2/mem_dina[10]} {debug/spi_capture_adc2/mem_dina[11]} {debug/spi_capture_adc2/mem_dina[12]} {debug/spi_capture_adc2/mem_dina[13]} {debug/spi_capture_adc2/mem_dina[14]} {debug/spi_capture_adc2/mem_dina[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 16 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {debug/spi_capture_adc2/MemBram_dina[0]} {debug/spi_capture_adc2/MemBram_dina[1]} {debug/spi_capture_adc2/MemBram_dina[2]} {debug/spi_capture_adc2/MemBram_dina[3]} {debug/spi_capture_adc2/MemBram_dina[4]} {debug/spi_capture_adc2/MemBram_dina[5]} {debug/spi_capture_adc2/MemBram_dina[6]} {debug/spi_capture_adc2/MemBram_dina[7]} {debug/spi_capture_adc2/MemBram_dina[8]} {debug/spi_capture_adc2/MemBram_dina[9]} {debug/spi_capture_adc2/MemBram_dina[10]} {debug/spi_capture_adc2/MemBram_dina[11]} {debug/spi_capture_adc2/MemBram_dina[12]} {debug/spi_capture_adc2/MemBram_dina[13]} {debug/spi_capture_adc2/MemBram_dina[14]} {debug/spi_capture_adc2/MemBram_dina[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 15 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {debug/spi_capture_adc2/mem_addra[0]} {debug/spi_capture_adc2/mem_addra[1]} {debug/spi_capture_adc2/mem_addra[2]} {debug/spi_capture_adc2/mem_addra[3]} {debug/spi_capture_adc2/mem_addra[4]} {debug/spi_capture_adc2/mem_addra[5]} {debug/spi_capture_adc2/mem_addra[6]} {debug/spi_capture_adc2/mem_addra[7]} {debug/spi_capture_adc2/mem_addra[8]} {debug/spi_capture_adc2/mem_addra[9]} {debug/spi_capture_adc2/mem_addra[10]} {debug/spi_capture_adc2/mem_addra[11]} {debug/spi_capture_adc2/mem_addra[12]} {debug/spi_capture_adc2/mem_addra[13]} {debug/spi_capture_adc2/mem_addra[14]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 16 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {debug/spi_capture_adc2/io_chan_adc_data1[0]} {debug/spi_capture_adc2/io_chan_adc_data1[1]} {debug/spi_capture_adc2/io_chan_adc_data1[2]} {debug/spi_capture_adc2/io_chan_adc_data1[3]} {debug/spi_capture_adc2/io_chan_adc_data1[4]} {debug/spi_capture_adc2/io_chan_adc_data1[5]} {debug/spi_capture_adc2/io_chan_adc_data1[6]} {debug/spi_capture_adc2/io_chan_adc_data1[7]} {debug/spi_capture_adc2/io_chan_adc_data1[8]} {debug/spi_capture_adc2/io_chan_adc_data1[9]} {debug/spi_capture_adc2/io_chan_adc_data1[10]} {debug/spi_capture_adc2/io_chan_adc_data1[11]} {debug/spi_capture_adc2/io_chan_adc_data1[12]} {debug/spi_capture_adc2/io_chan_adc_data1[13]} {debug/spi_capture_adc2/io_chan_adc_data1[14]} {debug/spi_capture_adc2/io_chan_adc_data1[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 8 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {adc_if/adc2/ADC_DQ_r[0]} {adc_if/adc2/ADC_DQ_r[1]} {adc_if/adc2/ADC_DQ_r[2]} {adc_if/adc2/ADC_DQ_r[3]} {adc_if/adc2/ADC_DQ_r[4]} {adc_if/adc2/ADC_DQ_r[5]} {adc_if/adc2/ADC_DQ_r[6]} {adc_if/adc2/ADC_DQ_r[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 8 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {adc_if/adc2/ADC_DI_r[0]} {adc_if/adc2/ADC_DI_r[1]} {adc_if/adc2/ADC_DI_r[2]} {adc_if/adc2/ADC_DI_r[3]} {adc_if/adc2/ADC_DI_r[4]} {adc_if/adc2/ADC_DI_r[5]} {adc_if/adc2/ADC_DI_r[6]} {adc_if/adc2/ADC_DI_r[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 16 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {adc2_d_o[0]} {adc2_d_o[1]} {adc2_d_o[2]} {adc2_d_o[3]} {adc2_d_o[4]} {adc2_d_o[5]} {adc2_d_o[6]} {adc2_d_o[7]} {adc2_d_o[8]} {adc2_d_o[9]} {adc2_d_o[10]} {adc2_d_o[11]} {adc2_d_o[12]} {adc2_d_o[13]} {adc2_d_o[14]} {adc2_d_o[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 8 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {ADC2_DA_IBUF[0]} {ADC2_DA_IBUF[1]} {ADC2_DA_IBUF[2]} {ADC2_DA_IBUF[3]} {ADC2_DA_IBUF[4]} {ADC2_DA_IBUF[5]} {ADC2_DA_IBUF[6]} {ADC2_DA_IBUF[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 8 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {ADC2_DB_IBUF[0]} {ADC2_DB_IBUF[1]} {ADC2_DB_IBUF[2]} {ADC2_DB_IBUF[3]} {ADC2_DB_IBUF[4]} {ADC2_DB_IBUF[5]} {ADC2_DB_IBUF[6]} {ADC2_DB_IBUF[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 15 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {debug/spi_capture_adc2/MemBram_addra[0]} {debug/spi_capture_adc2/MemBram_addra[1]} {debug/spi_capture_adc2/MemBram_addra[2]} {debug/spi_capture_adc2/MemBram_addra[3]} {debug/spi_capture_adc2/MemBram_addra[4]} {debug/spi_capture_adc2/MemBram_addra[5]} {debug/spi_capture_adc2/MemBram_addra[6]} {debug/spi_capture_adc2/MemBram_addra[7]} {debug/spi_capture_adc2/MemBram_addra[8]} {debug/spi_capture_adc2/MemBram_addra[9]} {debug/spi_capture_adc2/MemBram_addra[10]} {debug/spi_capture_adc2/MemBram_addra[11]} {debug/spi_capture_adc2/MemBram_addra[12]} {debug/spi_capture_adc2/MemBram_addra[13]} {debug/spi_capture_adc2/MemBram_addra[14]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list debug/spi_capture_adc2/MemBram_clka]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 1 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list debug/spi_capture_adc2/MemBram_ena]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list debug/spi_capture_adc2/MemBram_enb]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list debug/spi_capture_adc2/MemBram_wea]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list ADC3_DCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 16 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {debug/chan_adc_data3[0]} {debug/chan_adc_data3[1]} {debug/chan_adc_data3[2]} {debug/chan_adc_data3[3]} {debug/chan_adc_data3[4]} {debug/chan_adc_data3[5]} {debug/chan_adc_data3[6]} {debug/chan_adc_data3[7]} {debug/chan_adc_data3[8]} {debug/chan_adc_data3[9]} {debug/chan_adc_data3[10]} {debug/chan_adc_data3[11]} {debug/chan_adc_data3[12]} {debug/chan_adc_data3[13]} {debug/chan_adc_data3[14]} {debug/chan_adc_data3[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 15 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {debug/spi_capture_adc3/mem_addra[0]} {debug/spi_capture_adc3/mem_addra[1]} {debug/spi_capture_adc3/mem_addra[2]} {debug/spi_capture_adc3/mem_addra[3]} {debug/spi_capture_adc3/mem_addra[4]} {debug/spi_capture_adc3/mem_addra[5]} {debug/spi_capture_adc3/mem_addra[6]} {debug/spi_capture_adc3/mem_addra[7]} {debug/spi_capture_adc3/mem_addra[8]} {debug/spi_capture_adc3/mem_addra[9]} {debug/spi_capture_adc3/mem_addra[10]} {debug/spi_capture_adc3/mem_addra[11]} {debug/spi_capture_adc3/mem_addra[12]} {debug/spi_capture_adc3/mem_addra[13]} {debug/spi_capture_adc3/mem_addra[14]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 15 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {debug/spi_capture_adc3/MemBram_addra[0]} {debug/spi_capture_adc3/MemBram_addra[1]} {debug/spi_capture_adc3/MemBram_addra[2]} {debug/spi_capture_adc3/MemBram_addra[3]} {debug/spi_capture_adc3/MemBram_addra[4]} {debug/spi_capture_adc3/MemBram_addra[5]} {debug/spi_capture_adc3/MemBram_addra[6]} {debug/spi_capture_adc3/MemBram_addra[7]} {debug/spi_capture_adc3/MemBram_addra[8]} {debug/spi_capture_adc3/MemBram_addra[9]} {debug/spi_capture_adc3/MemBram_addra[10]} {debug/spi_capture_adc3/MemBram_addra[11]} {debug/spi_capture_adc3/MemBram_addra[12]} {debug/spi_capture_adc3/MemBram_addra[13]} {debug/spi_capture_adc3/MemBram_addra[14]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 16 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {debug/spi_capture_adc3/io_chan_adc_data1[0]} {debug/spi_capture_adc3/io_chan_adc_data1[1]} {debug/spi_capture_adc3/io_chan_adc_data1[2]} {debug/spi_capture_adc3/io_chan_adc_data1[3]} {debug/spi_capture_adc3/io_chan_adc_data1[4]} {debug/spi_capture_adc3/io_chan_adc_data1[5]} {debug/spi_capture_adc3/io_chan_adc_data1[6]} {debug/spi_capture_adc3/io_chan_adc_data1[7]} {debug/spi_capture_adc3/io_chan_adc_data1[8]} {debug/spi_capture_adc3/io_chan_adc_data1[9]} {debug/spi_capture_adc3/io_chan_adc_data1[10]} {debug/spi_capture_adc3/io_chan_adc_data1[11]} {debug/spi_capture_adc3/io_chan_adc_data1[12]} {debug/spi_capture_adc3/io_chan_adc_data1[13]} {debug/spi_capture_adc3/io_chan_adc_data1[14]} {debug/spi_capture_adc3/io_chan_adc_data1[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 16 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {debug/spi_capture_adc3/mem_dina[0]} {debug/spi_capture_adc3/mem_dina[1]} {debug/spi_capture_adc3/mem_dina[2]} {debug/spi_capture_adc3/mem_dina[3]} {debug/spi_capture_adc3/mem_dina[4]} {debug/spi_capture_adc3/mem_dina[5]} {debug/spi_capture_adc3/mem_dina[6]} {debug/spi_capture_adc3/mem_dina[7]} {debug/spi_capture_adc3/mem_dina[8]} {debug/spi_capture_adc3/mem_dina[9]} {debug/spi_capture_adc3/mem_dina[10]} {debug/spi_capture_adc3/mem_dina[11]} {debug/spi_capture_adc3/mem_dina[12]} {debug/spi_capture_adc3/mem_dina[13]} {debug/spi_capture_adc3/mem_dina[14]} {debug/spi_capture_adc3/mem_dina[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 16 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {debug/spi_capture_adc3/MemBram_dina[0]} {debug/spi_capture_adc3/MemBram_dina[1]} {debug/spi_capture_adc3/MemBram_dina[2]} {debug/spi_capture_adc3/MemBram_dina[3]} {debug/spi_capture_adc3/MemBram_dina[4]} {debug/spi_capture_adc3/MemBram_dina[5]} {debug/spi_capture_adc3/MemBram_dina[6]} {debug/spi_capture_adc3/MemBram_dina[7]} {debug/spi_capture_adc3/MemBram_dina[8]} {debug/spi_capture_adc3/MemBram_dina[9]} {debug/spi_capture_adc3/MemBram_dina[10]} {debug/spi_capture_adc3/MemBram_dina[11]} {debug/spi_capture_adc3/MemBram_dina[12]} {debug/spi_capture_adc3/MemBram_dina[13]} {debug/spi_capture_adc3/MemBram_dina[14]} {debug/spi_capture_adc3/MemBram_dina[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 8 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list {adc_if/adc3/ADC_DI_r[0]} {adc_if/adc3/ADC_DI_r[1]} {adc_if/adc3/ADC_DI_r[2]} {adc_if/adc3/ADC_DI_r[3]} {adc_if/adc3/ADC_DI_r[4]} {adc_if/adc3/ADC_DI_r[5]} {adc_if/adc3/ADC_DI_r[6]} {adc_if/adc3/ADC_DI_r[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 8 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list {adc_if/adc3/ADC_DQ_r[0]} {adc_if/adc3/ADC_DQ_r[1]} {adc_if/adc3/ADC_DQ_r[2]} {adc_if/adc3/ADC_DQ_r[3]} {adc_if/adc3/ADC_DQ_r[4]} {adc_if/adc3/ADC_DQ_r[5]} {adc_if/adc3/ADC_DQ_r[6]} {adc_if/adc3/ADC_DQ_r[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 8 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list {ADC3_DA_IBUF[0]} {ADC3_DA_IBUF[1]} {ADC3_DA_IBUF[2]} {ADC3_DA_IBUF[3]} {ADC3_DA_IBUF[4]} {ADC3_DA_IBUF[5]} {ADC3_DA_IBUF[6]} {ADC3_DA_IBUF[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 8 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list {ADC3_DB_IBUF[0]} {ADC3_DB_IBUF[1]} {ADC3_DB_IBUF[2]} {ADC3_DB_IBUF[3]} {ADC3_DB_IBUF[4]} {ADC3_DB_IBUF[5]} {ADC3_DB_IBUF[6]} {ADC3_DB_IBUF[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 16 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list {adc3_d_o[0]} {adc3_d_o[1]} {adc3_d_o[2]} {adc3_d_o[3]} {adc3_d_o[4]} {adc3_d_o[5]} {adc3_d_o[6]} {adc3_d_o[7]} {adc3_d_o[8]} {adc3_d_o[9]} {adc3_d_o[10]} {adc3_d_o[11]} {adc3_d_o[12]} {adc3_d_o[13]} {adc3_d_o[14]} {adc3_d_o[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
set_property port_width 1 [get_debug_ports u_ila_2/probe11]
connect_debug_port u_ila_2/probe11 [get_nets [list debug/spi_capture_adc3/MemBram_clka]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe12]
set_property port_width 1 [get_debug_ports u_ila_2/probe12]
connect_debug_port u_ila_2/probe12 [get_nets [list debug/spi_capture_adc3/MemBram_ena]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe13]
set_property port_width 1 [get_debug_ports u_ila_2/probe13]
connect_debug_port u_ila_2/probe13 [get_nets [list debug/spi_capture_adc3/MemBram_enb]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe14]
set_property port_width 1 [get_debug_ports u_ila_2/probe14]
connect_debug_port u_ila_2/probe14 [get_nets [list debug/spi_capture_adc3/MemBram_wea]]
create_debug_core u_ila_3 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_3]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_3]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_3]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_3]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_3]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_3]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_3]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_3]
set_property port_width 1 [get_debug_ports u_ila_3/clk]
connect_debug_port u_ila_3/clk [get_nets [list ADC4_DCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe0]
set_property port_width 16 [get_debug_ports u_ila_3/probe0]
connect_debug_port u_ila_3/probe0 [get_nets [list {debug/chan_adc_data4[0]} {debug/chan_adc_data4[1]} {debug/chan_adc_data4[2]} {debug/chan_adc_data4[3]} {debug/chan_adc_data4[4]} {debug/chan_adc_data4[5]} {debug/chan_adc_data4[6]} {debug/chan_adc_data4[7]} {debug/chan_adc_data4[8]} {debug/chan_adc_data4[9]} {debug/chan_adc_data4[10]} {debug/chan_adc_data4[11]} {debug/chan_adc_data4[12]} {debug/chan_adc_data4[13]} {debug/chan_adc_data4[14]} {debug/chan_adc_data4[15]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe1]
set_property port_width 15 [get_debug_ports u_ila_3/probe1]
connect_debug_port u_ila_3/probe1 [get_nets [list {debug/spi_capture_adc4/MemBram_addra[0]} {debug/spi_capture_adc4/MemBram_addra[1]} {debug/spi_capture_adc4/MemBram_addra[2]} {debug/spi_capture_adc4/MemBram_addra[3]} {debug/spi_capture_adc4/MemBram_addra[4]} {debug/spi_capture_adc4/MemBram_addra[5]} {debug/spi_capture_adc4/MemBram_addra[6]} {debug/spi_capture_adc4/MemBram_addra[7]} {debug/spi_capture_adc4/MemBram_addra[8]} {debug/spi_capture_adc4/MemBram_addra[9]} {debug/spi_capture_adc4/MemBram_addra[10]} {debug/spi_capture_adc4/MemBram_addra[11]} {debug/spi_capture_adc4/MemBram_addra[12]} {debug/spi_capture_adc4/MemBram_addra[13]} {debug/spi_capture_adc4/MemBram_addra[14]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe2]
set_property port_width 15 [get_debug_ports u_ila_3/probe2]
connect_debug_port u_ila_3/probe2 [get_nets [list {debug/spi_capture_adc4/mem_addra[0]} {debug/spi_capture_adc4/mem_addra[1]} {debug/spi_capture_adc4/mem_addra[2]} {debug/spi_capture_adc4/mem_addra[3]} {debug/spi_capture_adc4/mem_addra[4]} {debug/spi_capture_adc4/mem_addra[5]} {debug/spi_capture_adc4/mem_addra[6]} {debug/spi_capture_adc4/mem_addra[7]} {debug/spi_capture_adc4/mem_addra[8]} {debug/spi_capture_adc4/mem_addra[9]} {debug/spi_capture_adc4/mem_addra[10]} {debug/spi_capture_adc4/mem_addra[11]} {debug/spi_capture_adc4/mem_addra[12]} {debug/spi_capture_adc4/mem_addra[13]} {debug/spi_capture_adc4/mem_addra[14]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe3]
set_property port_width 16 [get_debug_ports u_ila_3/probe3]
connect_debug_port u_ila_3/probe3 [get_nets [list {debug/spi_capture_adc4/MemBram_dina[0]} {debug/spi_capture_adc4/MemBram_dina[1]} {debug/spi_capture_adc4/MemBram_dina[2]} {debug/spi_capture_adc4/MemBram_dina[3]} {debug/spi_capture_adc4/MemBram_dina[4]} {debug/spi_capture_adc4/MemBram_dina[5]} {debug/spi_capture_adc4/MemBram_dina[6]} {debug/spi_capture_adc4/MemBram_dina[7]} {debug/spi_capture_adc4/MemBram_dina[8]} {debug/spi_capture_adc4/MemBram_dina[9]} {debug/spi_capture_adc4/MemBram_dina[10]} {debug/spi_capture_adc4/MemBram_dina[11]} {debug/spi_capture_adc4/MemBram_dina[12]} {debug/spi_capture_adc4/MemBram_dina[13]} {debug/spi_capture_adc4/MemBram_dina[14]} {debug/spi_capture_adc4/MemBram_dina[15]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe4]
set_property port_width 16 [get_debug_ports u_ila_3/probe4]
connect_debug_port u_ila_3/probe4 [get_nets [list {debug/spi_capture_adc4/io_chan_adc_data1[0]} {debug/spi_capture_adc4/io_chan_adc_data1[1]} {debug/spi_capture_adc4/io_chan_adc_data1[2]} {debug/spi_capture_adc4/io_chan_adc_data1[3]} {debug/spi_capture_adc4/io_chan_adc_data1[4]} {debug/spi_capture_adc4/io_chan_adc_data1[5]} {debug/spi_capture_adc4/io_chan_adc_data1[6]} {debug/spi_capture_adc4/io_chan_adc_data1[7]} {debug/spi_capture_adc4/io_chan_adc_data1[8]} {debug/spi_capture_adc4/io_chan_adc_data1[9]} {debug/spi_capture_adc4/io_chan_adc_data1[10]} {debug/spi_capture_adc4/io_chan_adc_data1[11]} {debug/spi_capture_adc4/io_chan_adc_data1[12]} {debug/spi_capture_adc4/io_chan_adc_data1[13]} {debug/spi_capture_adc4/io_chan_adc_data1[14]} {debug/spi_capture_adc4/io_chan_adc_data1[15]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe5]
set_property port_width 16 [get_debug_ports u_ila_3/probe5]
connect_debug_port u_ila_3/probe5 [get_nets [list {debug/spi_capture_adc4/mem_dina[0]} {debug/spi_capture_adc4/mem_dina[1]} {debug/spi_capture_adc4/mem_dina[2]} {debug/spi_capture_adc4/mem_dina[3]} {debug/spi_capture_adc4/mem_dina[4]} {debug/spi_capture_adc4/mem_dina[5]} {debug/spi_capture_adc4/mem_dina[6]} {debug/spi_capture_adc4/mem_dina[7]} {debug/spi_capture_adc4/mem_dina[8]} {debug/spi_capture_adc4/mem_dina[9]} {debug/spi_capture_adc4/mem_dina[10]} {debug/spi_capture_adc4/mem_dina[11]} {debug/spi_capture_adc4/mem_dina[12]} {debug/spi_capture_adc4/mem_dina[13]} {debug/spi_capture_adc4/mem_dina[14]} {debug/spi_capture_adc4/mem_dina[15]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe6]
set_property port_width 8 [get_debug_ports u_ila_3/probe6]
connect_debug_port u_ila_3/probe6 [get_nets [list {adc_if/adc4/ADC_DI_r[0]} {adc_if/adc4/ADC_DI_r[1]} {adc_if/adc4/ADC_DI_r[2]} {adc_if/adc4/ADC_DI_r[3]} {adc_if/adc4/ADC_DI_r[4]} {adc_if/adc4/ADC_DI_r[5]} {adc_if/adc4/ADC_DI_r[6]} {adc_if/adc4/ADC_DI_r[7]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe7]
set_property port_width 8 [get_debug_ports u_ila_3/probe7]
connect_debug_port u_ila_3/probe7 [get_nets [list {adc_if/adc4/ADC_DQ_r[0]} {adc_if/adc4/ADC_DQ_r[1]} {adc_if/adc4/ADC_DQ_r[2]} {adc_if/adc4/ADC_DQ_r[3]} {adc_if/adc4/ADC_DQ_r[4]} {adc_if/adc4/ADC_DQ_r[5]} {adc_if/adc4/ADC_DQ_r[6]} {adc_if/adc4/ADC_DQ_r[7]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe8]
set_property port_width 16 [get_debug_ports u_ila_3/probe8]
connect_debug_port u_ila_3/probe8 [get_nets [list {adc4_d_o[0]} {adc4_d_o[1]} {adc4_d_o[2]} {adc4_d_o[3]} {adc4_d_o[4]} {adc4_d_o[5]} {adc4_d_o[6]} {adc4_d_o[7]} {adc4_d_o[8]} {adc4_d_o[9]} {adc4_d_o[10]} {adc4_d_o[11]} {adc4_d_o[12]} {adc4_d_o[13]} {adc4_d_o[14]} {adc4_d_o[15]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe9]
set_property port_width 8 [get_debug_ports u_ila_3/probe9]
connect_debug_port u_ila_3/probe9 [get_nets [list {ADC4_DA_IBUF[0]} {ADC4_DA_IBUF[1]} {ADC4_DA_IBUF[2]} {ADC4_DA_IBUF[3]} {ADC4_DA_IBUF[4]} {ADC4_DA_IBUF[5]} {ADC4_DA_IBUF[6]} {ADC4_DA_IBUF[7]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe10]
set_property port_width 8 [get_debug_ports u_ila_3/probe10]
connect_debug_port u_ila_3/probe10 [get_nets [list {ADC4_DB_IBUF[0]} {ADC4_DB_IBUF[1]} {ADC4_DB_IBUF[2]} {ADC4_DB_IBUF[3]} {ADC4_DB_IBUF[4]} {ADC4_DB_IBUF[5]} {ADC4_DB_IBUF[6]} {ADC4_DB_IBUF[7]}]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe11]
set_property port_width 1 [get_debug_ports u_ila_3/probe11]
connect_debug_port u_ila_3/probe11 [get_nets [list debug/spi_capture_adc4/MemBram_clka]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe12]
set_property port_width 1 [get_debug_ports u_ila_3/probe12]
connect_debug_port u_ila_3/probe12 [get_nets [list debug/spi_capture_adc4/MemBram_ena]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe13]
set_property port_width 1 [get_debug_ports u_ila_3/probe13]
connect_debug_port u_ila_3/probe13 [get_nets [list debug/spi_capture_adc4/MemBram_enb]]
create_debug_port u_ila_3 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_3/probe14]
set_property port_width 1 [get_debug_ports u_ila_3/probe14]
connect_debug_port u_ila_3/probe14 [get_nets [list debug/spi_capture_adc4/MemBram_wea]]
create_debug_core u_ila_4 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_4]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_4]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_4]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_4]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_4]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_4]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_4]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_4]
set_property port_width 1 [get_debug_ports u_ila_4/clk]
connect_debug_port u_ila_4/clk [get_nets [list clk_adc/inst/clk_250m]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe0]
set_property port_width 5 [get_debug_ports u_ila_4/probe0]
connect_debug_port u_ila_4/probe0 [get_nets [list {dds_data1[0]} {dds_data1[1]} {dds_data1[2]} {dds_data1[3]} {dds_data1[4]}]]
create_debug_port u_ila_4 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe1]
set_property port_width 5 [get_debug_ports u_ila_4/probe1]
connect_debug_port u_ila_4/probe1 [get_nets [list {dds_data3[0]} {dds_data3[1]} {dds_data3[2]} {dds_data3[3]} {dds_data3[4]}]]
create_debug_port u_ila_4 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe2]
set_property port_width 5 [get_debug_ports u_ila_4/probe2]
connect_debug_port u_ila_4/probe2 [get_nets [list {dds_data2[0]} {dds_data2[1]} {dds_data2[2]} {dds_data2[3]} {dds_data2[4]}]]
create_debug_port u_ila_4 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_4/probe3]
set_property port_width 5 [get_debug_ports u_ila_4/probe3]
connect_debug_port u_ila_4/probe3 [get_nets [list {dds_data4[0]} {dds_data4[1]} {dds_data4[2]} {dds_data4[3]} {dds_data4[4]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_250m]
