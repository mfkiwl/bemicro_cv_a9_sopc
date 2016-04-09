
module reset_seq #(
    parameter EPC_WIDTH         = 20
)
(
    input   wire                ref_clk,
    input   wire                reset_n,
    input   wire                ddr3_mem_afi_reset_n,

    output  wire                ddr3_mem_global_reset_n,
    output  wire                ddr3_mem_soft_reset_n,
    output  wire                wb_rst,
    output  wire                wb_clk,
    output  wire                phy_rst_n,
    output  wire                eth_25mhz_clk,
    output  wire                eth_2500khz_clk,
    output  wire                eth_25mhz_90deg_clk,
    output  wire                eth_2500khz_90deg_clk
);

    localparam      [63:0]      ZERO = 64'h0000_0000_0000_0000;
    localparam      [63:0]      ONE  = 64'h0000_0000_0000_0001;
    
    reg     [2:0]               cpu_reset_sync_chain;
    reg     [2:0]               reset_n_sync_chain;
    reg     [9:0]               cpu_reset_ctr;
    reg     [EPC_WIDTH-1:0]     phy_reset_ctr;
    
    wire                        release_cpu_reset;
    wire                        pll_system_locked;

    // PLL
    pll_system pll_system0 (
        .refclk                     (ref_clk),
        .rst                        (~reset_n),
        .outclk_0                   (wb_clk),
        .outclk_1                   (eth_25mhz_clk),
        .outclk_2                   (eth_25mhz_90deg_clk),
        .outclk_3                   (eth_2500khz_clk),
        .outclk_4                   (eth_2500khz_90deg_clk),
        .locked                     (pll_system_locked)
    );

    assign ddr3_mem_global_reset_n = reset_n & pll_system_locked;
    assign ddr3_mem_soft_reset_n = reset_n & pll_system_locked;
    assign release_cpu_reset = reset_n & ddr3_mem_afi_reset_n & pll_system_locked; 

    // reset_n synchronizer chain
    always @(posedge wb_clk or negedge reset_n)
    begin
        if(~reset_n)
            reset_n_sync_chain <= 3'b000;
        else
            reset_n_sync_chain <= {1'b1, reset_n_sync_chain[2:1]};
    end

    // CPU reset sychronizer chain
    always @(posedge wb_clk or negedge release_cpu_reset)
    begin
        if(~release_cpu_reset)
            cpu_reset_sync_chain <= 3'b000;
        else
            cpu_reset_sync_chain <= {1'b1, cpu_reset_sync_chain[2:1]};
    end

    // PHY reset counter
    always @(posedge wb_clk or negedge reset_n_sync_chain[0])
    begin
        if(~reset_n_sync_chain[0])
            phy_reset_ctr <= ZERO[EPC_WIDTH-1:0];
        else if(phy_reset_ctr[EPC_WIDTH-1] == 1'b0)
            phy_reset_ctr <= phy_reset_ctr + ONE[EPC_WIDTH-1:0];
    end

    // CPU reset counter
    always @(posedge wb_clk or negedge cpu_reset_sync_chain[0])
    begin
        if(~cpu_reset_sync_chain[0])
            cpu_reset_ctr <= 10'b00_0000_0000;
        else if(~cpu_reset_ctr[9])
            cpu_reset_ctr <= cpu_reset_ctr + 10'b00_0000_0001;
    end
    
    assign wb_rst = ~cpu_reset_ctr[9];
    assign phy_rst_n = phy_reset_ctr[EPC_WIDTH-1];
    
endmodule
