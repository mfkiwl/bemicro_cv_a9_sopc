
module ddr3_interface 
(
    input   wire            ddr3_pll_ref_clk,
    input   wire            global_reset_n,
    input   wire            soft_reset_n,
    output  wire            afi_reset_n,

    // DDR3 pins
    input   wire            ddr3_oct_rzqin_pad_i,
    output  wire    [12:0]  ddr3_a_pad_o,
    output  wire    [2:0]   ddr3_ba_pad_o,
    output  wire    [0:0]   ddr3_cas_n_pad_o,
    output  wire    [0:0]   ddr3_clk_p_pad_o,
    output  wire    [0:0]   ddr3_clk_n_pad_o,
    output  wire    [0:0]   ddr3_cke_pad_o,
    output  wire    [0:0]   ddr3_cs_n_pad_o,
    output  wire    [1:0]   ddr3_dm_pad_o,
    inout   wire    [15:0]  ddr3_dq_pad_io,
    inout   wire    [1:0]   ddr3_dqs_p_pad_io,
    inout   wire    [1:0]   ddr3_dqs_n_pad_io,
    output  wire    [0:0]   ddr3_odt_pad_o,
    output  wire    [0:0]   ddr3_ras_n_pad_o,
    output  wire            ddr3_reset_n_pad_o,
    output  wire    [0:0]   ddr3_we_n_pad_o,

    input   wire            wb_clk,
    input   wire            wb_rst,

    input   wire    [31:0]  wb0_adr_i,
    input   wire    [31:0]  wb0_dat_i,
    input   wire            wb0_stb_i,
    input   wire            wb0_cyc_i,
    input   wire    [2:0]   wb0_cti_i,
    input   wire    [1:0]   wb0_bte_i,
    input   wire            wb0_we_i,
    input   wire    [3:0]   wb0_sel_i,
    output  wire    [31:0]  wb0_dat_o,
    output  wire            wb0_ack_o,
    output  wire            wb0_err_o,
    output  wire            wb0_rty_o,

    input   wire    [31:0]  wb1_adr_i,
    input   wire    [31:0]  wb1_dat_i,
    input   wire            wb1_stb_i,
    input   wire            wb1_cyc_i,
    input   wire    [2:0]   wb1_cti_i,
    input   wire    [1:0]   wb1_bte_i,
    input   wire            wb1_we_i,
    input   wire    [3:0]   wb1_sel_i,
    output  wire    [31:0]  wb1_dat_o,
    output  wire            wb1_ack_o,
    output  wire            wb1_err_o,
    output  wire            wb1_rty_o
);

    // Avalon-MM connections.
    wire                    avl_ready_0;
    wire                    avl_burstbegin_0;
    wire    [24:0]          avl_addr_0;
    wire                    avl_rdata_valid_0;
    wire    [31:0]          avl_rdata_0;
    wire    [31:0]          avl_wdata_0;
    wire    [3:0]           avl_be_0;
    wire                    avl_read_req_0;
    wire                    avl_write_req_0;
    wire    [2:0]           avl_size_0;

    wire                    avl_ready_1;
    wire                    avl_burstbegin_1;
    wire    [24:0]          avl_addr_1;
    wire                    avl_rdata_valid_1;
    wire    [31:0]          avl_rdata_1;
    wire    [31:0]          avl_wdata_1;
    wire    [3:0]           avl_be_1;
    wire                    avl_read_req_1;
    wire                    avl_write_req_1;
    wire    [2:0]           avl_size_1;

    ddr3_sdram ram_if (
        .pll_ref_clk                            (ddr3_pll_ref_clk),
        .global_reset_n                         (global_reset_n),
        .soft_reset_n                           (soft_reset_n),
        .afi_clk                                (),
        .afi_half_clk                           (),
        .afi_reset_n                            (afi_reset_n),
        .afi_reset_export_n                     (),
        .seq_debug_clk                          (wb_clk),
        .seq_debug_reset_n                      (soft_reset_n),
        .mem_a                                  (ddr3_a_pad_o),
        .mem_ba                                 (ddr3_ba_pad_o),
        .mem_ck                                 (ddr3_clk_p_pad_o),
        .mem_ck_n                               (ddr3_clk_n_pad_o),
        .mem_cke                                (ddr3_cke_pad_o),
        .mem_cs_n                               (ddr3_cs_n_pad_o),
        .mem_dm                                 (ddr3_dm_pad_o),
        .mem_ras_n                              (ddr3_ras_n_pad_o),
        .mem_cas_n                              (ddr3_cas_n_pad_o),
        .mem_we_n                               (ddr3_we_n_pad_o),
        .mem_reset_n                            (ddr3_reset_n_pad_o),
        .mem_dq                                 (ddr3_dq_pad_io),
        .mem_dqs                                (ddr3_dqs_p_pad_io),
        .mem_dqs_n                              (ddr3_dqs_n_pad_io),
        .mem_odt                                (ddr3_odt_pad_o),
        .avl_ready_0                            (avl_ready_0),
        .avl_burstbegin_0                       (avl_burstbegin_0),
        .avl_addr_0                             (avl_addr_0),
        .avl_rdata_valid_0                      (avl_rdata_valid_0),
        .avl_rdata_0                            (avl_rdata_0),
        .avl_wdata_0                            (avl_wdata_0),
        .avl_be_0                               (avl_be_0),
        .avl_read_req_0                         (avl_read_req_0),
        .avl_write_req_0                        (avl_write_req_0),
        .avl_size_0                             (avl_size_0),
        .avl_ready_1                            (avl_ready_1),
        .avl_burstbegin_1                       (avl_burstbegin_1),
        .avl_addr_1                             (avl_addr_1),
        .avl_rdata_valid_1                      (avl_rdata_valid_1),
        .avl_rdata_1                            (avl_rdata_1),
        .avl_wdata_1                            (avl_wdata_1),
        .avl_be_1                               (avl_be_1),
        .avl_read_req_1                         (avl_read_req_1),
        .avl_write_req_1                        (avl_write_req_1),
        .avl_size_1                             (avl_size_1),
        .mp_cmd_clk_0_clk                       (wb_clk),
        .mp_cmd_reset_n_0_reset_n               (~wb_rst),
        .mp_cmd_clk_1_clk                       (wb_clk),
        .mp_cmd_reset_n_1_reset_n               (~wb_rst),
        .mp_rfifo_clk_0_clk                     (wb_clk),
        .mp_rfifo_reset_n_0_reset_n             (~wb_rst),
        .mp_wfifo_clk_0_clk                     (wb_clk),
        .mp_wfifo_reset_n_0_reset_n             (~wb_rst),
        .mp_rfifo_clk_1_clk                     (wb_clk),
        .mp_rfifo_reset_n_1_reset_n             (~wb_rst),
        .mp_wfifo_clk_1_clk                     (wb_clk),
        .mp_wfifo_reset_n_1_reset_n             (~wb_rst),
        .local_init_done                        (),
        .local_cal_success                      (),
        .local_cal_fail                         (),
        .oct_rzqin                              (ddr3_oct_rzqin_pad_i),
        .pll_mem_clk                            (),
        .pll_write_clk                          (),
        .pll_locked                             (),
        .pll_write_clk_pre_phy_clk              (),
        .pll_addr_cmd_clk                       (),
        .pll_avl_clk                            (),
        .pll_config_clk                         (),
        .pll_mem_phy_clk                        (),
        .afi_phy_clk                            (),
        .pll_avl_phy_clk                        ()
	);

    wb_to_avalon_bridge #(
        .DW                                     (32),
        .AW                                     (32),
        .BURST_SUPPORT                          (1)
    ) wb0_to_avl0 (
        .wb_clk_i                               (wb_clk),
        .wb_rst_i                               (wb_rst),
        .wb_adr_i                               (wb0_adr_i),
        .wb_dat_i                               (wb0_dat_i),
        .wb_stb_i                               (wb0_stb_i),
        .wb_cyc_i                               (wb0_cyc_i),
        .wb_cti_i                               (wb0_cti_i),
        .wb_bte_i                               (wb0_bte_i),
        .wb_we_i                                (wb0_we_i),
        .wb_sel_i                               (wb0_sel_i),
        .wb_dat_o                               (wb0_dat_o),
        .wb_ack_o                               (wb0_ack_o),
        .wb_err_o                               (wb0_err_o),
        .wb_rty_o                               (wb0_rty_o),

        .m_av_address_o                         (avl_addr_0),
        .m_av_byteenable_o                      (avl_be_0),
        .m_av_read_o                            (avl_read_req_0),
        .m_av_readdata_i                        (avl_rdata_0),
        .m_av_burstcount_o                      (avl_size_0),
        .m_av_write_o                           (avl_write_req_0),
        .m_av_writedata_o                       (avl_wdata_0),
        .m_av_waitrequest_i                     (avl_ready_0),
        .m_av_readdatavalid_i                   (avl_rdata_valid_0)
    );

    wb_to_avalon_bridge #(
        .DW                                     (32),
        .AW                                     (32),
        .BURST_SUPPORT                          (1)
    ) wb1_to_avl1 (
        .wb_clk_i                               (wb_clk),
        .wb_rst_i                               (wb_rst),
        .wb_adr_i                               (wb1_adr_i),
        .wb_dat_i                               (wb1_dat_i),
        .wb_stb_i                               (wb1_stb_i),
        .wb_cyc_i                               (wb1_cyc_i),
        .wb_cti_i                               (wb1_cti_i),
        .wb_bte_i                               (wb1_bte_i),
        .wb_we_i                                (wb1_we_i),
        .wb_sel_i                               (wb1_sel_i),
        .wb_dat_o                               (wb1_dat_o),
        .wb_ack_o                               (wb1_ack_o),
        .wb_err_o                               (wb1_err_o),
        .wb_rty_o                               (wb1_rty_o),

        .m_av_address_o                         (avl_addr_1),
        .m_av_byteenable_o                      (avl_be_1),
        .m_av_read_o                            (avl_read_req_1),
        .m_av_readdata_i                        (avl_rdata_1),
        .m_av_burstcount_o                      (avl_size_1),
        .m_av_write_o                           (avl_write_req_1),
        .m_av_writedata_o                       (avl_wdata_1),
        .m_av_waitrequest_i                     (avl_ready_1),
        .m_av_readdatavalid_i                   (avl_rdata_valid_1)
    );

endmodule



