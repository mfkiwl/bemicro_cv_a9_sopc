
set J11_VOLTAGE_SETTING "3.3-V LVTTL"

# Assignments for special pins

set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION       "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION       "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION        "USE AS REGULAR IO"
set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION   "USE AS REGULAR IO"

set_location_assignment PIN_H13                                -to DDR3_CLK_50MHZ
set_location_assignment PIN_M9                                 -to CLK_24MHZ

set_location_assignment PIN_L7                                 -to DDR3_A[0]
set_location_assignment PIN_K7                                 -to DDR3_A[1]
set_location_assignment PIN_H8                                 -to DDR3_A[2]
set_location_assignment PIN_G8                                 -to DDR3_A[3]
set_location_assignment PIN_J7                                 -to DDR3_A[4]
set_location_assignment PIN_J8                                 -to DDR3_A[5]
set_location_assignment PIN_A10                                -to DDR3_A[6]
set_location_assignment PIN_A9                                 -to DDR3_A[7]
set_location_assignment PIN_A8                                 -to DDR3_A[8]
set_location_assignment PIN_A7                                 -to DDR3_A[9]
set_location_assignment PIN_C6                                 -to DDR3_A[10]
set_location_assignment PIN_D6                                 -to DDR3_A[11]
set_location_assignment PIN_D7                                 -to DDR3_A[12]
set_location_assignment PIN_A5                                 -to DDR3_BA[0]
set_location_assignment PIN_B10                                -to DDR3_BA[1]
set_location_assignment PIN_C9                                 -to DDR3_BA[2]
set_location_assignment PIN_B6                                 -to DDR3_CASn[0]
set_location_assignment PIN_J9                                 -to DDR3_CLK_P[0]
set_location_assignment PIN_H9                                 -to DDR3_CLK_N[0]
set_location_assignment PIN_F14                                -to DDR3_CKE[0]
set_location_assignment PIN_E9                                 -to DDR3_CSn[0]
set_location_assignment PIN_G11                                -to DDR3_DM[0]
set_location_assignment PIN_J17                                -to DDR3_DM[1]
set_location_assignment PIN_E12                                -to DDR3_DQ[0]
set_location_assignment PIN_D12                                -to DDR3_DQ[1]
set_location_assignment PIN_C11                                -to DDR3_DQ[2]
set_location_assignment PIN_K9                                 -to DDR3_DQ[3]
set_location_assignment PIN_C13                                -to DDR3_DQ[4]
set_location_assignment PIN_D13                                -to DDR3_DQ[5]
set_location_assignment PIN_B12                                -to DDR3_DQ[6]
set_location_assignment PIN_F12                                -to DDR3_DQ[7]
set_location_assignment PIN_F13                                -to DDR3_DQ[8]
set_location_assignment PIN_E14                                -to DDR3_DQ[9]
set_location_assignment PIN_J11                                -to DDR3_DQ[10]
set_location_assignment PIN_A13                                -to DDR3_DQ[11]
set_location_assignment PIN_B15                                -to DDR3_DQ[12]
set_location_assignment PIN_C15                                -to DDR3_DQ[13]
set_location_assignment PIN_G15                                -to DDR3_DQ[14]
set_location_assignment PIN_K16                                -to DDR3_DQ[15]
set_location_assignment PIN_H11                                -to DDR3_DQS_P[0]
set_location_assignment PIN_H14                                -to DDR3_DQS_P[1]
set_location_assignment PIN_G12                                -to DDR3_DQS_N[0]
set_location_assignment PIN_J13                                -to DDR3_DQS_N[1]
set_location_assignment PIN_L8                                 -to DDR3_ODT[0]
set_location_assignment PIN_B7                                 -to DDR3_RASn[0]
set_location_assignment PIN_J19                                -to DDR3_RESETn
set_location_assignment PIN_F7                                 -to DDR3_WEn[0]
set_location_assignment PIN_B11                                -to DDR3_OCT_RZQIN

set_location_assignment PIN_P16                                -to EEPROM_SDA
set_location_assignment PIN_P17                                -to EEPROM_SCL

set_location_assignment PIN_M8                                 -to ENET_RX_CLK
set_location_assignment PIN_L22                                -to ENET_GTX_CLK
set_location_assignment PIN_K21                                -to ENET_RSTn
set_location_assignment PIN_N8                                 -to ENET_INTn
set_location_assignment PIN_K22                                -to ENET_TX_EN
set_location_assignment PIN_V9                                 -to ENET_RX_DV
set_location_assignment PIN_V13                                -to ENET_MDC
set_location_assignment PIN_AB12                               -to ENET_MDIO
set_location_assignment PIN_M21                                -to ENET_TXD[0]
set_location_assignment PIN_M20                                -to ENET_TXD[1]
set_location_assignment PIN_N21                                -to ENET_TXD[2]
set_location_assignment PIN_N20                                -to ENET_TXD[3]
set_location_assignment PIN_AB6                                -to ENET_RXD[0]
set_location_assignment PIN_AB5                                -to ENET_RXD[1]
set_location_assignment PIN_AA7                                -to ENET_RXD[2]
set_location_assignment PIN_AB7                                -to ENET_RXD[3]

set_location_assignment PIN_AB4                                -to FPGA_DATA[0]
set_location_assignment PIN_AB3                                -to FPGA_DATA[1]
set_location_assignment PIN_V3                                 -to FPGA_DCLK
set_location_assignment PIN_R4                                 -to FPGA_nCSO

set_location_assignment PIN_B17                                -to USER_LED[1]
set_location_assignment PIN_E19                                -to USER_LED[2]
set_location_assignment PIN_E21                                -to USER_LED[3]
set_location_assignment PIN_B21                                -to USER_LED[4]
set_location_assignment PIN_C20                                -to USER_LED[5]
set_location_assignment PIN_C21                                -to USER_LED[6]
set_location_assignment PIN_D19                                -to USER_LED[7]
set_location_assignment PIN_D21                                -to USER_LED[8] 

set_location_assignment PIN_H18                                -to TACT1 
set_location_assignment PIN_J18                                -to TACT2 

set_location_assignment PIN_C16                                -to DIP_SW[1]
set_location_assignment PIN_D17                                -to DIP_SW[2]
set_location_assignment PIN_G17                                -to DIP_SW[3]
set_location_assignment PIN_E16                                -to DIP_SW[4]

set_instance_assignment -name IO_STANDARD "1.8 V"              -to DDR3_CLK_50MHZ
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to CLK_24MHZ

set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to EEPROM_SDA
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to EEPROM_SCL

set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RX_CLK
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_GTX_CLK
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RSTn
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_INTn
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_TX_EN
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RX_DV
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_MDC
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_MDIO
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_TXD[0]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_TXD[1]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_TXD[2]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_TXD[3]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RXD[0]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RXD[1]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RXD[2]
set_instance_assignment -name IO_STANDARD $J11_VOLTAGE_SETTING -to ENET_RXD[3]


set_instance_assignment -name IO_STANDARD "3.3-V LVTTL"        -to FPGA_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL"        -to FPGA_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL"        -to FPGA_DCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL"        -to FPGA_nCSO

set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[1]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[2]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[3]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[4]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[5]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[6]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[7]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to USER_LED[8]

set_instance_assignment -name IO_STANDARD "1.5 V"              -to TACT1
set_instance_assignment -name IO_STANDARD "1.5 V"              -to TACT2

set_instance_assignment -name IO_STANDARD "1.5 V"              -to DIP_SW[1]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to DIP_SW[2]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to DIP_SW[3]
set_instance_assignment -name IO_STANDARD "1.5 V"              -to DIP_SW[4]

