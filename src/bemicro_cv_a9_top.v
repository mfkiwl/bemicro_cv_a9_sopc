
module bemicro_cv_a9_top (
    // Clock pins
    input   wire            DDR3_CLK_50MHZ,
    input   wire            CLK_24MHZ,
    
    // LED pins
    output  wire    [7:0]   USER_LED,
    
    // Push button pins
    input   wire            TACT1,
    input   wire            TACT2,
    input   wire    [3:0]   DIP_SW,
    
    // DDR3 pins
    input   wire            DDR3_OCT_RZQIN,
    output  wire    [12:0]  DDR3_A,
    output  wire    [2:0]   DDR3_BA,
    output  wire    [0:0]   DDR3_CASn,
    output  wire    [0:0]   DDR3_CLK_P,
    output  wire    [0:0]   DDR3_CLK_N,
    output  wire    [0:0]   DDR3_CKE,
    output  wire    [0:0]   DDR3_CSn,
    output  wire    [1:0]   DDR3_DM,
    inout   wire    [15:0]  DDR3_DQ,
    inout   wire    [1:0]   DDR3_DQS_P,
    inout   wire    [1:0]   DDR3_DQS_N,
    output  wire    [0:0]   DDR3_ODT,
    output  wire    [0:0]   DDR3_RASn,
    output  wire            DDR3_RESETn,
    output  wire	[0:0]   DDR3_WEn,
    
    // Ethernet PHY pins
    input   wire            ENET_RX_CLK,
    output  wire            ENET_GTX_CLK,
    output  wire            ENET_RSTn,
    input   wire            ENET_INTn,
    output  wire            ENET_TX_EN,
    input   wire            ENET_RX_DV,
    output  wire            ENET_MDC,
    inout   wire            ENET_MDIO,
    output  wire	[3:0]	ENET_TXD,
    input   wire	[3:0]	ENET_RXD,
    
    // EEPROM pins
    inout   wire            EEPROM_SDA,
    output  wire            EEPROM_SCL,
    
    // SD card pins
    output  wire            SDCLK,
    output  wire            SDCMD,
    inout   wire    [3:0]   SDD
);

endmodule

