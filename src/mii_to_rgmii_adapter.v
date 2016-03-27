
`timescale 1 ns / 1 ps


module simulation_ddr_out #(
    parameter WIDTH = 1
)
(
    input   wire                        aclr,
    input   wire    [WIDTH-1:0]         datain_h,
    input   wire    [WIDTH-1:0]         datain_l,
    input   wire                        outclock,
    output  wire    [WIDTH-1:0]         dataout
);
    localparam      [63:0]              ZERO = 64'h0000_0000_0000_0000;
    reg             [WIDTH-1:0]         r_datain_h, r_datain_l;

    always @(posedge outclock or posedge aclr)
    begin
        if(aclr) begin
            r_datain_h <= ZERO[WIDTH-1:0];
            r_datain_l <= ZERO[WIDTH-1:0];
        end
        else begin
            r_datain_h <= datain_h;
            r_datain_l <= datain_l;
        end
    end

    assign dataout = outclock ? r_datain_h : r_datain_l;

endmodule


module simulation_ddr_in #(
    parameter WIDTH = 1
)
(
    input   wire                        aclr,
    input   wire    [WIDTH-1:0]         datain,
    input   wire                        inclock,
    output  wire    [WIDTH-1:0]         dataout_h,
    output  wire    [WIDTH-1:0]         dataout_l
);
    localparam      [63:0]              ZERO = 64'h0000_0000_0000_0000;
    reg             [WIDTH-1:0]         r_dataout_h, r_dataout_l;

    always @(posedge inclock or posedge aclr)
    begin
        if(aclr) begin
            r_dataout_h <= ZERO[WIDTH-1:0];
        end
        else begin
            r_dataout_h <= datain;
        end
    end
    
    always @(negedge inclock or posedge aclr)
    begin
        if(aclr) begin
            r_dataout_l <= ZERO[WIDTH-1:0];
        end
        else begin
            r_dataout_l <= datain;
        end
    end

    assign dataout_h = r_dataout_h;
    assign dataout_l = r_dataout_l;

endmodule


module mii_to_rgmii_adapter #(
    parameter SIMULATION = 0
)
(
    // Asynchronous reset
    input   wire            rst,

    // Transmit clocks
    input   wire            clk_int_25mhz,
    input   wire            clk_int_2500khz,
    input   wire            clk_ext_25mhz,
    input   wire            clk_ext_2500khz,

    // Select 10 Mbps mode (asynchronous)
    input   wire            eth_10mbps,
    
    // RGMII signals
    input   wire            rgmii_rx_clk,
    output  wire            rgmii_gtx_clk,
    output  wire            rgmii_tx_en,
    input   wire            rgmii_rx_dv,
    output  wire    [3:0]   rgmii_txd,
    input   wire    [3:0]   rgmii_rxd,

    // MII signals
    output  wire            mii_rx_clk,
    output  wire    [3:0]   mii_rxd,
    output  wire            mii_rx_dv,
    output  wire            mii_rx_er,
    output  wire            mii_col,
    output  wire            mii_crs,
    input   wire    [3:0]   mii_txd,
    input   wire            mii_tx_en,
    input   wire            mii_tx_er,
    output  wire            mii_tx_clk

);
    
    wire                    clk_ddr_out;
    wire                    clk_gtx_out;
    wire    [1:0]           rx_ctl;
    wire    [7:0]           rxd;
    reg     [2:0]           enable_25mhz_clk;
    reg     [2:0]           enable_2500khz_clk;
    reg     [1:0]           rx_ctl_r;
    reg     [7:0]           rxd_r;

    always @(posedge clk_int_25mhz or posedge eth_10mbps or posedge rst)
    begin
        if(eth_10mbps | rst)
            enable_25mhz_clk <= 3'b0;
        else
            enable_25mhz_clk <= {1'b1, enable_25mhz_clk[2:1]};
    end
        
    always @(posedge clk_int_2500khz or negedge eth_10mbps or posedge rst)
    begin
        if(~eth_10mbps | rst)
            enable_2500khz_clk <= 3'b0;
        else
            enable_2500khz_clk <= {1'b1, enable_2500khz_clk[2:1]};
    end

    assign clk_ddr_out = (enable_25mhz_clk[0] & clk_int_25mhz) | (enable_2500khz_clk[0] & clk_int_2500khz);
    assign clk_gtx_out = (enable_25mhz_clk[0] & clk_ext_25mhz) | (enable_2500khz_clk[0] & clk_ext_2500khz);

    assign mii_tx_clk  = clk_ddr_out;
    assign mii_rx_clk = rgmii_rx_clk;

    assign mii_rx_dv = rx_ctl[0];
    assign mii_rx_er = rx_ctl[0] ^ rx_ctl[1];
    assign mii_rxd = rxd[3:0];

    assign mii_crs = rx_ctl_r[0] == 1'b1 || (rx_ctl_r == 2'b10 && (rxd_r == 8'h0E || rxd_r == 8'h0F || rxd_r == 8'h1F || rxd_r == 8'hFF)) ? 1'b1 : 1'b0;
    assign mii_col = mii_crs & mii_tx_en;

    always @(posedge rgmii_rx_clk or posedge rst)
    begin
        if(rst) begin
            rx_ctl_r <= 2'b00;
            rxd_r <= 8'h00;
        end
        else begin
            rx_ctl_r <= rx_ctl;
            rxd_r <= rxd;
        end
    end

    generate 
        if(SIMULATION == 0) begin
            // RGMII TX_EN DDR output
            altddio_out_1 rgmii_tx_en_out (
                .aclr               (rst),
                .datain_h           (mii_tx_en),
                .datain_l           (mii_tx_en ^ mii_tx_er),
                .outclock           (clk_ddr_out),
                .dataout            (rgmii_tx_en)
            );

            // RGMII TX_EN DDR output
            altddio_out_1 rgmii_gtx_clk_out (
                .aclr               (rst),
                .datain_h           (1'b1),
                .datain_l           (1'b0),
                .outclock           (clk_gtx_out),
                .dataout            (rgmii_gtx_clk)
            );

            // RGMII TXD DDR output
            altddio_out_4 rgmii_txd_out (
                .aclr               (rst),
                .datain_h           (mii_txd),
                .datain_l           (mii_txd),
                .outclock           (clk_ddr_out),
                .dataout            (rgmii_txd)
            );

            // RGMII RX_DV DDR input
            altddio_in_1 rgmii_rx_dv_in (
                .aclr               (rst),
                .datain             (rgmii_rx_dv),
                .inclock            (rgmii_rx_clk),
                .dataout_h          (rx_ctl[0]),
                .dataout_l          (rx_ctl[1])
            );

            // RGMII RXD DDR input
            altddio_in_4 rgmii_rxd_in (
                .aclr               (rst),
                .datain             (rgmii_rxd),
                .inclock            (rgmii_rx_clk),
                .dataout_h          (rxd[3:0]),
                .dataout_l          (rxd[7:4])
            );
        end
        else begin
            // RGMII TX_EN DDR output
            simulation_ddr_out #(
                .WIDTH              (1)
            )
            rgmii_tx_en_out (
                .aclr               (rst),
                .datain_h           (mii_tx_en),
                .datain_l           (mii_tx_en ^ mii_tx_er),
                .outclock           (clk_ddr_out),
                .dataout            (rgmii_tx_en)
            );

            // RGMII TX_EN DDR output
            simulation_ddr_out #(
                .WIDTH              (1)
            )
            rgmii_gtx_clk_out (
                .aclr               (rst),
                .datain_h           (1'b1),
                .datain_l           (1'b0),
                .outclock           (clk_gtx_out),
                .dataout            (rgmii_gtx_clk)
            );

            // RGMII TXD DDR output
            simulation_ddr_out #(
                .WIDTH              (4)
            )
            rgmii_txd_out (
                .aclr               (rst),
                .datain_h           (mii_txd),
                .datain_l           (mii_txd),
                .outclock           (clk_ddr_out),
                .dataout            (rgmii_txd)
            );

            // RGMII RX_DV DDR input
            simulation_ddr_in #(
                .WIDTH              (1)
            )
            rgmii_rx_dv_in (
                .aclr               (rst),
                .datain             (rgmii_rx_dv),
                .inclock            (rgmii_rx_clk),
                .dataout_h          (rx_ctl[0]),
                .dataout_l          (rx_ctl[1])
            );

            // RGMII RXD DDR input
            simulation_ddr_in #(
                .WIDTH              (4)
            )
            rgmii_rxd_in (
                .aclr               (rst),
                .datain             (rgmii_rxd),
                .inclock            (rgmii_rx_clk),
                .dataout_h          (rxd[3:0]),
                .dataout_l          (rxd[7:4])
            );

        end
    endgenerate

endmodule
