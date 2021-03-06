# XC7VX485T-2FFG1761 FPGA
# PHY TEST PINOUT
#--------------------Pinout Constraints-----------------
# CLK & RESET
set_property PACKAGE_PIN AV40 [get_ports RESET]
set_property PACKAGE_PIN E19 [get_ports SYSCLK_P]
set_property PACKAGE_PIN E18 [get_ports SYSCLK_N]
# LED7
set_property PACKAGE_PIN AU39 [get_ports LED]


# ADC PORT
set_property PACKAGE_PIN M24 [get_ports ADC1_DCOP]
set_property PACKAGE_PIN L24 [get_ports ADC1_DCON]
set_property PACKAGE_PIN J40 [get_ports ADC2_DCOP]
set_property PACKAGE_PIN J41 [get_ports ADC2_DCON]
set_property PACKAGE_PIN U36 [get_ports ADC3_DCOP]
set_property PACKAGE_PIN T37 [get_ports ADC3_DCON]
set_property PACKAGE_PIN AF41 [get_ports ADC4_DCOP]
set_property PACKAGE_PIN AG41 [get_ports ADC4_DCON]

set_property PACKAGE_PIN M22 [get_ports {ADC1_DA[0]}]
set_property PACKAGE_PIN L22 [get_ports {ADC1_DA[1]}]
set_property PACKAGE_PIN M21 [get_ports {ADC1_DA[2]}]
set_property PACKAGE_PIN L21 [get_ports {ADC1_DA[3]}]
set_property PACKAGE_PIN J21 [get_ports {ADC1_DA[4]}]
set_property PACKAGE_PIN H21 [get_ports {ADC1_DA[5]}]
set_property PACKAGE_PIN G21 [get_ports {ADC1_DA[6]}]
set_property PACKAGE_PIN G22 [get_ports {ADC1_DA[7]}]
set_property PACKAGE_PIN K22 [get_ports {ADC1_DB[0]}]
set_property PACKAGE_PIN J23 [get_ports {ADC1_DB[1]}]
set_property PACKAGE_PIN J22 [get_ports {ADC1_DB[2]}]
set_property PACKAGE_PIN K23 [get_ports {ADC1_DB[3]}]
set_property PACKAGE_PIN G27 [get_ports {ADC1_DB[4]}]
set_property PACKAGE_PIN G26 [get_ports {ADC1_DB[5]}]
set_property PACKAGE_PIN J26 [get_ports {ADC1_DB[6]}]
set_property PACKAGE_PIN J25 [get_ports {ADC1_DB[7]}]

set_property PACKAGE_PIN J37 [get_ports {ADC2_DA[0]}]
set_property PACKAGE_PIN H38 [get_ports {ADC2_DA[1]}]
set_property PACKAGE_PIN J38 [get_ports {ADC2_DA[2]}]
set_property PACKAGE_PIN G38 [get_ports {ADC2_DA[3]}]
set_property PACKAGE_PIN E37 [get_ports {ADC2_DA[4]}]
set_property PACKAGE_PIN E38 [get_ports {ADC2_DA[5]}]
set_property PACKAGE_PIN C35 [get_ports {ADC2_DA[6]}]
set_property PACKAGE_PIN C36 [get_ports {ADC2_DA[7]}]
set_property PACKAGE_PIN G37 [get_ports {ADC2_DB[0]}]
set_property PACKAGE_PIN G36 [get_ports {ADC2_DB[1]}]
set_property PACKAGE_PIN C39 [get_ports {ADC2_DB[2]}]
set_property PACKAGE_PIN C38 [get_ports {ADC2_DB[3]}]
set_property PACKAGE_PIN D33 [get_ports {ADC2_DB[4]}]
set_property PACKAGE_PIN E33 [get_ports {ADC2_DB[5]}]
set_property PACKAGE_PIN G33 [get_ports {ADC2_DB[6]}]
set_property PACKAGE_PIN H33 [get_ports {ADC2_DB[7]}]

set_property PACKAGE_PIN V39 [get_ports {ADC3_DA[0]}]
set_property PACKAGE_PIN T32 [get_ports {ADC3_DA[1]}]
set_property PACKAGE_PIN V40 [get_ports {ADC3_DA[2]}]
set_property PACKAGE_PIN R32 [get_ports {ADC3_DA[3]}]
set_property PACKAGE_PIN T36 [get_ports {ADC3_DA[4]}]
set_property PACKAGE_PIN P37 [get_ports {ADC3_DA[5]}]
set_property PACKAGE_PIN R37 [get_ports {ADC3_DA[6]}]
set_property PACKAGE_PIN P38 [get_ports {ADC3_DA[7]}]
set_property PACKAGE_PIN V36 [get_ports {ADC3_DB[0]}]
set_property PACKAGE_PIN V35 [get_ports {ADC3_DB[1]}]
set_property PACKAGE_PIN W37 [get_ports {ADC3_DB[2]}]
set_property PACKAGE_PIN W36 [get_ports {ADC3_DB[3]}]
set_property PACKAGE_PIN T35 [get_ports {ADC3_DB[4]}]
set_property PACKAGE_PIN U34 [get_ports {ADC3_DB[5]}]
set_property PACKAGE_PIN R34 [get_ports {ADC3_DB[6]}]
set_property PACKAGE_PIN R33 [get_ports {ADC3_DB[7]}]

set_property PACKAGE_PIN AE34 [get_ports {ADC4_DA[0]}]
set_property PACKAGE_PIN AF31 [get_ports {ADC4_DA[1]}]
set_property PACKAGE_PIN AE35 [get_ports {ADC4_DA[2]}]
set_property PACKAGE_PIN AF32 [get_ports {ADC4_DA[3]}]
set_property PACKAGE_PIN AF35 [get_ports {ADC4_DA[4]}]
set_property PACKAGE_PIN AF36 [get_ports {ADC4_DA[5]}]
set_property PACKAGE_PIN AC34 [get_ports {ADC4_DA[6]}]
set_property PACKAGE_PIN AD35 [get_ports {ADC4_DA[7]}]
set_property PACKAGE_PIN AB32 [get_ports {ADC4_DB[0]}]
set_property PACKAGE_PIN AB31 [get_ports {ADC4_DB[1]}]
set_property PACKAGE_PIN AD31 [get_ports {ADC4_DB[2]}]
set_property PACKAGE_PIN AC31 [get_ports {ADC4_DB[3]}]
set_property PACKAGE_PIN AD30 [get_ports {ADC4_DB[4]}]
set_property PACKAGE_PIN AC30 [get_ports {ADC4_DB[5]}]
set_property PACKAGE_PIN AA30 [get_ports {ADC4_DB[6]}]
set_property PACKAGE_PIN AA29 [get_ports {ADC4_DB[7]}]

# DAC PORT
set_property PACKAGE_PIN D35 [get_ports DAC1_DCKIP]
set_property PACKAGE_PIN D36 [get_ports DAC1_DCKIN]
set_property PACKAGE_PIN E34 [get_ports DAC1_DCKOP]
set_property PACKAGE_PIN E35 [get_ports DAC1_DCKON]
set_property PACKAGE_PIN C33 [get_ports DAC1_TSTP]
set_property PACKAGE_PIN C34 [get_ports DAC1_TSTN]

set_property PACKAGE_PIN G28 [get_ports {DAC1_DAP[6]}]
set_property PACKAGE_PIN G29 [get_ports {DAC1_DAN[6]}]
set_property PACKAGE_PIN B32 [get_ports {DAC1_DAP[7]}]
set_property PACKAGE_PIN B33 [get_ports {DAC1_DAN[7]}]
set_property PACKAGE_PIN B34 [get_ports {DAC1_DAP[8]}]
set_property PACKAGE_PIN A34 [get_ports {DAC1_DAN[8]}]
set_property PACKAGE_PIN B39 [get_ports {DAC1_DAP[9]}]
set_property PACKAGE_PIN A39 [get_ports {DAC1_DAN[9]}]
set_property PACKAGE_PIN P25 [get_ports {DAC1_DAP[10]}]
set_property PACKAGE_PIN P26 [get_ports {DAC1_DAN[10]}]

set_property PACKAGE_PIN K28 [get_ports {DAC1_DBP[6]}]
set_property PACKAGE_PIN J28 [get_ports {DAC1_DBN[6]}]
set_property PACKAGE_PIN K27 [get_ports {DAC1_DBP[7]}]
set_property PACKAGE_PIN J27 [get_ports {DAC1_DBN[7]}]
set_property PACKAGE_PIN H24 [get_ports {DAC1_DBP[8]}]
set_property PACKAGE_PIN G24 [get_ports {DAC1_DBN[8]}]
set_property PACKAGE_PIN H23 [get_ports {DAC1_DBP[9]}]
set_property PACKAGE_PIN G23 [get_ports {DAC1_DBN[9]}]
set_property PACKAGE_PIN H25 [get_ports {DAC1_DBP[10]}]
set_property PACKAGE_PIN H26 [get_ports {DAC1_DBN[10]}]


set_property PACKAGE_PIN L39 [get_ports DAC2_DCKIP]
set_property PACKAGE_PIN L40 [get_ports DAC2_DCKIN]
set_property PACKAGE_PIN N30 [get_ports DAC2_TSTP]
set_property PACKAGE_PIN M31 [get_ports DAC2_TSTN]
set_property PACKAGE_PIN K39 [get_ports DAC2_DCKOP]
set_property PACKAGE_PIN K40 [get_ports DAC2_DCKON]

set_property PACKAGE_PIN P41 [get_ports {DAC2_DAP[6]}]
set_property PACKAGE_PIN N41 [get_ports {DAC2_DAN[6]}]
set_property PACKAGE_PIN K37 [get_ports {DAC2_DAP[7]}]
set_property PACKAGE_PIN K38 [get_ports {DAC2_DAN[7]}]
set_property PACKAGE_PIN M36 [get_ports {DAC2_DAP[8]}]
set_property PACKAGE_PIN L37 [get_ports {DAC2_DAN[8]}]
set_property PACKAGE_PIN Y29 [get_ports {DAC2_DAP[9]}]
set_property PACKAGE_PIN Y30 [get_ports {DAC2_DAN[9]}]
set_property PACKAGE_PIN F40 [get_ports {DAC2_DAP[10]}]
set_property PACKAGE_PIN F41 [get_ports {DAC2_DAN[10]}]

set_property PACKAGE_PIN M42 [get_ports {DAC2_DBP[6]}]
set_property PACKAGE_PIN L42 [get_ports {DAC2_DBN[6]}]
set_property PACKAGE_PIN H40 [get_ports {DAC2_DBP[7]}]
set_property PACKAGE_PIN H41 [get_ports {DAC2_DBN[7]}]
set_property PACKAGE_PIN M37 [get_ports {DAC2_DBP[8]}]
set_property PACKAGE_PIN M38 [get_ports {DAC2_DBN[8]}]
set_property PACKAGE_PIN G41 [get_ports {DAC2_DBP[9]}]
set_property PACKAGE_PIN G42 [get_ports {DAC2_DBN[9]}]
set_property PACKAGE_PIN R40 [get_ports {DAC2_DBP[10]}]
set_property PACKAGE_PIN P40 [get_ports {DAC2_DBN[10]}]


set_property PACKAGE_PIN AD32 [get_ports DAC3_DCKIP]
set_property PACKAGE_PIN AD33 [get_ports DAC3_DCKIN]
set_property PACKAGE_PIN AB33 [get_ports DAC3_DCKOP]
set_property PACKAGE_PIN AC33 [get_ports DAC3_DCKON]
set_property PACKAGE_PIN AE37 [get_ports DAC3_TSTP]
set_property PACKAGE_PIN AF37 [get_ports DAC3_TSTN]

set_property PACKAGE_PIN W40 [get_ports {DAC3_DAP[6]}]
set_property PACKAGE_PIN Y40 [get_ports {DAC3_DAN[6]}]
set_property PACKAGE_PIN AC35 [get_ports {DAC3_DAP[7]}]
set_property PACKAGE_PIN AC36 [get_ports {DAC3_DAN[7]}]
set_property PACKAGE_PIN AD36 [get_ports {DAC3_DAP[8]}]
set_property PACKAGE_PIN AD37 [get_ports {DAC3_DAN[8]}]
set_property PACKAGE_PIN AG36 [get_ports {DAC3_DAP[9]}]
set_property PACKAGE_PIN AH36 [get_ports {DAC3_DAN[9]}]
set_property PACKAGE_PIN P32 [get_ports {DAC3_DAP[10]}]
set_property PACKAGE_PIN P33 [get_ports {DAC3_DAN[10]}]

set_property PACKAGE_PIN U32 [get_ports {DAC3_DBP[6]}]
set_property PACKAGE_PIN U33 [get_ports {DAC3_DBN[6]}]
set_property PACKAGE_PIN R38 [get_ports {DAC3_DBP[7]}]
set_property PACKAGE_PIN R39 [get_ports {DAC3_DBN[7]}]
set_property PACKAGE_PIN W32 [get_ports {DAC3_DBP[8]}]
set_property PACKAGE_PIN W33 [get_ports {DAC3_DBN[8]}]
set_property PACKAGE_PIN P35 [get_ports {DAC3_DBP[9]}]
set_property PACKAGE_PIN P36 [get_ports {DAC3_DBN[9]}]
set_property PACKAGE_PIN N33 [get_ports {DAC3_DBP[10]}]
set_property PACKAGE_PIN N34 [get_ports {DAC3_DBN[10]}]


set_property PACKAGE_PIN AF39 [get_ports DAC4_DCKIP]
set_property PACKAGE_PIN AF40 [get_ports DAC4_DCKIN]
set_property PACKAGE_PIN AD40 [get_ports DAC4_DCKOP]
set_property PACKAGE_PIN AD41 [get_ports DAC4_DCKON]
set_property PACKAGE_PIN U39 [get_ports DAC4_TSTP]
set_property PACKAGE_PIN T39 [get_ports DAC4_TSTN]


set_property PACKAGE_PIN AK39 [get_ports {DAC4_DAP[6]}]
set_property PACKAGE_PIN AL39 [get_ports {DAC4_DAN[6]}]
set_property PACKAGE_PIN AJ40 [get_ports {DAC4_DAP[7]}]
set_property PACKAGE_PIN AJ41 [get_ports {DAC4_DAN[7]}]
set_property PACKAGE_PIN AC38 [get_ports {DAC4_DAP[8]}]
set_property PACKAGE_PIN AC39 [get_ports {DAC4_DAN[8]}]
set_property PACKAGE_PIN V33 [get_ports {DAC4_DAP[9]}]
set_property PACKAGE_PIN V34 [get_ports {DAC4_DAN[9]}]
set_property PACKAGE_PIN Y42 [get_ports {DAC4_DAP[10]}]
set_property PACKAGE_PIN AA42 [get_ports {DAC4_DAN[10]}]

set_property PACKAGE_PIN AJ42 [get_ports {DAC4_DBP[6]}]
set_property PACKAGE_PIN AK42 [get_ports {DAC4_DBN[6]}]
set_property PACKAGE_PIN AL41 [get_ports {DAC4_DBP[7]}]
set_property PACKAGE_PIN AL42 [get_ports {DAC4_DBN[7]}]
set_property PACKAGE_PIN AD42 [get_ports {DAC4_DBP[8]}]
set_property PACKAGE_PIN AE42 [get_ports {DAC4_DBN[8]}]
set_property PACKAGE_PIN AC40 [get_ports {DAC4_DBP[9]}]
set_property PACKAGE_PIN AC41 [get_ports {DAC4_DBN[9]}]
set_property PACKAGE_PIN Y39 [get_ports {DAC4_DBP[10]}]
set_property PACKAGE_PIN AA39 [get_ports {DAC4_DBN[10]}]

# FPGA IO INOUT
set_property PACKAGE_PIN Y32 [get_ports {FMC_IO[1]}]
set_property PACKAGE_PIN Y33 [get_ports {FMC_IO[2]}]
set_property PACKAGE_PIN AB29 [get_ports {FMC_IO[3]}]
set_property PACKAGE_PIN AC29 [get_ports {FMC_IO[4]}]
set_property PACKAGE_PIN AE29 [get_ports {FMC_IO[5]}]
set_property PACKAGE_PIN AE30 [get_ports {FMC_IO[6]}]
set_property PACKAGE_PIN AA31 [get_ports {FMC_IO[7]}]
set_property PACKAGE_PIN AA32 [get_ports {FMC_IO[8]}]
set_property PACKAGE_PIN AE32 [get_ports {FMC_IO[9]}]
set_property PACKAGE_PIN AE33 [get_ports {FMC_IO[10]}]
set_property PACKAGE_PIN AF34 [get_ports {FMC_IO[11]}]
set_property PACKAGE_PIN AG34 [get_ports {FMC_IO[12]}]
set_property PACKAGE_PIN AB41 [get_ports {FMC_IO[13]}]
set_property PACKAGE_PIN AB42 [get_ports {FMC_IO[14]}]
set_property PACKAGE_PIN AJ38 [get_ports {FMC_IO[15]}]
set_property PACKAGE_PIN AK38 [get_ports {FMC_IO[16]}]
set_property PACKAGE_PIN AB36 [get_ports {FMC_IO[17]}]
set_property PACKAGE_PIN AB37 [get_ports {FMC_IO[18]}]
set_property PACKAGE_PIN AA34 [get_ports {FMC_IO[19]}]
set_property PACKAGE_PIN AA35 [get_ports {FMC_IO[20]}]
set_property PACKAGE_PIN Y35 [get_ports {FMC_IO[21]}]
set_property PACKAGE_PIN AA36 [get_ports {FMC_IO[22]}]
set_property PACKAGE_PIN Y37 [get_ports {FMC_IO[23]}]
set_property PACKAGE_PIN AA37 [get_ports {FMC_IO[24]}]
set_property PACKAGE_PIN L30 [get_ports {FMC_IO[25]}]
set_property PACKAGE_PIN L29 [get_ports {FMC_IO[26]}]
set_property PACKAGE_PIN P31 [get_ports {FMC_IO[27]}]
set_property PACKAGE_PIN R30 [get_ports {FMC_IO[28]}]
set_property PACKAGE_PIN W31 [get_ports FMC_IO_29]
set_property PACKAGE_PIN N28 [get_ports FMC_IO_30]
set_property PACKAGE_PIN W30 [get_ports FMC_IO_31]
set_property PACKAGE_PIN N29 [get_ports FMC_IO_32]

# IOSTANDARD
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
set_property IOSTANDARD LVCMOS18 [get_ports RESET]

set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DA[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC1_DB[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DA[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC2_DB[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DA[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC3_DB[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DA[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC4_DB[0]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DAP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC1_DBP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DAP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC2_DBP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DAP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC3_DBP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DAP[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBN[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBN[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBN[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBN[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBN[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBP[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBP[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBP[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBP[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC4_DBP[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports FMC_IO_31]
set_property IOSTANDARD LVCMOS18 [get_ports FMC_IO_30]
set_property IOSTANDARD LVCMOS18 [get_ports FMC_IO_29]
set_property IOSTANDARD LVCMOS18 [get_ports FMC_IO_28]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[27]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[26]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[25]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[24]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[23]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[22]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[21]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[19]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[17]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[16]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {FMC_IO[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports LED]

set_property IOSTANDARD LVDS [get_ports ADC1_DCOP]
set_property IOSTANDARD LVDS [get_ports ADC2_DCOP]
set_property IOSTANDARD LVDS [get_ports ADC3_DCOP]
set_property IOSTANDARD LVDS [get_ports ADC4_DCOP]
set_property IOSTANDARD LVDS [get_ports DAC1_DCKOP]
set_property IOSTANDARD LVDS [get_ports DAC1_TSTP]
set_property IOSTANDARD LVDS [get_ports DAC1_TSTN]
set_property IOSTANDARD LVDS [get_ports DAC2_DCKOP]
set_property IOSTANDARD LVDS [get_ports DAC2_TSTP]
set_property IOSTANDARD LVDS [get_ports DAC2_TSTN]
set_property IOSTANDARD LVDS [get_ports DAC3_DCKIP]
set_property IOSTANDARD LVDS [get_ports DAC3_DCKOP]
set_property IOSTANDARD LVDS [get_ports DAC3_TSTP]
set_property IOSTANDARD LVDS [get_ports DAC3_TSTN]
set_property IOSTANDARD LVDS [get_ports DAC4_DCKOP]
set_property IOSTANDARD LVDS [get_ports DAC4_TSTP]
set_property IOSTANDARD LVDS [get_ports DAC4_TSTN]


# PCIE constraints
set_property PACKAGE_PIN AV35 [get_ports PCIE_RESET_N]
set_property IOSTANDARD LVCMOS18 [get_ports PCIE_RESET_N]
set_property PULLUP true [get_ports PCIE_RESET_N]

set_property IOSTANDARD LVCMOS18 [get_ports LED_PCIE]
set_property IOSTANDARD LVCMOS18 [get_ports LED_FIFO_FULL]
set_property PACKAGE_PIN AN39 [get_ports LED_PCIE]
set_property PACKAGE_PIN AR37 [get_ports LED_FIFO_FULL]











