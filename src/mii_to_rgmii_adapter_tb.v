
`timescale 1 ns / 1 ps

module mii_to_rgmii_adapter_tb ();

    reg                         uut_rst;
    reg                         uut_clk_int_25mhz;
    reg                         uut_clk_int_2500khz;
    reg                         uut_clk_ext_25mhz;
    reg                         uut_clk_ext_2500khz;
    reg                         uut_eth_10mbps;
    reg                         uut_rgmii_rx_clk;
    wire                        uut_rgmii_gtx_clk;
    wire                        uut_rgmii_tx_en;
    reg                         uut_rgmii_rx_dv;
    wire    [3:0]               uut_rgmii_txd;
    reg     [3:0]               uut_rgmii_rxd;
    wire                        uut_mii_rx_clk;
    wire    [3:0]               uut_mii_rxd;
    wire                        uut_mii_rx_dv;
    wire                        uut_mii_rx_er;
    wire                        uut_mii_col;
    wire                        uut_mii_crs;
    reg     [3:0]               uut_mii_txd;
    reg                         uut_mii_tx_en;
    reg                         uut_mii_tx_er;
    wire                        uut_mii_tx_clk;      
    

    mii_to_rgmii_adapter #(
        .SIMULATION             (1)
    )
    uut (
        .rst                    (uut_rst),
        
        .clk_int_25mhz          (uut_clk_int_25mhz),
        .clk_int_2500khz        (uut_clk_int_2500khz),
        .clk_ext_25mhz          (uut_clk_ext_25mhz),
        .clk_ext_2500khz        (uut_clk_ext_2500khz),
        
        .eth_10mbps             (uut_eth_10mbps),

        .rgmii_rx_clk           (uut_rgmii_rx_clk),
        .rgmii_gtx_clk          (uut_rgmii_gtx_clk),
        .rgmii_tx_en            (uut_rgmii_tx_en),
        .rgmii_rx_dv            (uut_rgmii_rx_dv),
        .rgmii_txd              (uut_rgmii_txd),
        .rgmii_rxd              (uut_rgmii_rxd),

        .mii_rx_clk             (uut_mii_rx_clk),
        .mii_rxd                (uut_mii_rxd),
        .mii_rx_dv              (uut_mii_rx_dv),
        .mii_rx_er              (uut_mii_rx_er),
        .mii_col                (uut_mii_col),
        .mii_crs                (uut_mii_crs),
        .mii_txd                (uut_mii_txd),
        .mii_tx_en              (uut_mii_tx_en),
        .mii_tx_er              (uut_mii_tx_er),
        .mii_tx_clk             (uut_mii_tx_clk)      
    );

    initial
    begin
        uut_rst = 1'b1;
        uut_clk_int_25mhz = 1'b0;
        uut_clk_int_2500khz = 1'b0;
        uut_clk_ext_25mhz = 1'b0;
        uut_clk_ext_2500khz = 1'b0;
        uut_eth_10mbps = 1'b0;
        uut_mii_txd = 4'b0000;
        uut_mii_tx_en = 1'b0;
        uut_mii_tx_er = 1'b0;
        uut_rgmii_rxd = 4'b0000;
        uut_rgmii_rx_dv = 1'b0;

        #1 uut_rst = 1'b0;
    end

    // Generate 25 MHz internal clock
    always
    begin
        #10 uut_clk_int_25mhz = 1'b1;
        #20 uut_clk_int_25mhz = 1'b0;
        #10 uut_clk_int_25mhz = 1'b0;
    end

    // Generate 2500 kHz internal clock
    always
    begin
        #10 uut_clk_int_2500khz = 1'b1;
        #200 uut_clk_int_2500khz = 1'b0;
        #190 uut_clk_int_2500khz = 1'b0;
    end

    // Generate 25 MHz external clock
    always
    begin
        #20 uut_clk_ext_25mhz = !uut_clk_ext_25mhz;
    end

    // Generate 2500 kHz external clock
    always
    begin
        #110 uut_clk_ext_2500khz = 1'b1;
        #200 uut_clk_ext_2500khz = 1'b0;
        #90  uut_clk_ext_2500khz = 1'b0;
    end
endmodule

