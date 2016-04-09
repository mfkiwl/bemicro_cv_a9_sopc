
module bemicro_cv_a9_sopc_top (
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
    output  wire    [0:0]   DDR3_WEn,
    
    // Ethernet PHY pins
    input   wire            ENET_RX_CLK,
    output  wire            ENET_GTX_CLK,
    output  wire            ENET_RSTn,
    input   wire            ENET_INTn,
    output  wire            ENET_TX_EN,
    input   wire            ENET_RX_DV,
    output  wire            ENET_MDC,
    inout   wire            ENET_MDIO,
    output  wire    [3:0]   ENET_TXD,
    input   wire    [3:0]   ENET_RXD,
    
    // EEPROM pins
    inout   wire            EEPROM_SDA,
    output  wire            EEPROM_SCL,

    // EPCQ256 pins
    output  wire            FPGA_DCLK,
    output  wire            FPGA_nCSO,
    output  wire            FPGA_DATA0,
    input   wire            FPGA_DATA1,


    
    // SD card pins
    output  wire            SDCLK,
    output  wire            SDCMD,
    inout   wire    [3:0]   SDD
);
    
`include "wb_intercon.vh"

    wire                    ddr3_mem_afi_reset_n;
    wire                    ddr3_mem_global_reset_n
    wire                    ddr3_mem_soft_reset_n;
    wire                    wb_rst;
    wire                    wb_clk;
    wire                    eth_25mhz_clk;
    wire                    eth_2500khz_clk;
    wire                    eth_25mhz_90deg_clk;
    wire                    eth_2500khz_90deg_clk;

    // JTAG wires
    wire                    jtag_tck_o;
    wire                    jtag_tdi_o;
    wire                    jtag_shift_dr_o;
    wire                    jtag_capture_dr_o;
    wire                    jtag_pause_dr_o;
    wire                    jtag_update_dr_o;
    wire                    jtag_debug_select_o;

    // Connections between CPU and debug unit
    wire    [31:0]          cpu_dbg_adr_i;
    wire    [31:0]          cpu_dbg_dat_i;
    wire                    cpu_dbg_stb_i;
    wire                    cpu_dbg_we_i;
    wire                    cpu_dbg_stall_i;
    wire    [31:0]          cpu_dbg_dat_o;
    wire                    cpu_dbg_ack_o;
    wire                    cpu_dbg_bp_o;

    // Debug unit jtag
    wire                    cpu_dbg_tdo_o;

    // SPI flash mem wires
    wire                    spi_flash_mem_irq;

    // eth0 wires
    wire                    eth0_mtxd_pad_o;
    wire                    eth0_mtxen_pad_o;
    wire                    eth0_mtxerr_pad_o;
    wire                    eth0_mtx_clk_pad_i;

    wire                    eth0_mrx_clk_pad_i;
    wire                    eth0_mrxd_pad_i;
    wire                    eth0_mrxdv_pad_i;
    wire                    eth0_mrxerr_pad_i;
    wire                    eth0_mcoll_pad_i;
    wire                    eth0_mcrs_pad_i;

    wire                    eth0_md_pad_o;
    wire                    eth0_md_pad_oe;
    wire                    eth0_int_o;

    // Reset sequencer
    reset_seq reset_seq0 (
        .ref_clk                    (DDR3_CLK_50MHZ),
        .reset_n                    (TACT1),
        .ddr3_mem_afi_reset_n       (ddr3_mem_afi_reset_n),
        .ddr3_mem_global_reset_n    (ddr3_mem_global_reset_n),
        .ddr3_mem_soft_reset_n      (ddr3_mem_soft_reset_n),
        .wb_rst                     (wb_rst),
        .wb_clk                     (wb_clk),
        .eth_25mhz_clk              (eth_25mhz_clk),
        .eth_2500khz_clk            (eth_2500khz_clk),
        .eth_25mhz_90deg_clk        (eth_25mhz_90deg_clk),
        .eth_2500khz_90deg_clk      (eth_2500khz_90deg_clk)
    );

    // JTAG
    altera_virtual_jtag jtag (
        .tck_o                      (jtag_tck_o),
        .debug_tdo_i                (cpu_dbg_tdo_o),
        .tdi_o                      (jtag_tdi_o),
        .test_logic_reset_o         (),
        .run_test_idle_o            (),
        .shift_dr_o                 (jtag_shift_dr_o),
        .capture_dr_o               (jtag_capture_dr_o),
        .pause_dr_o                 (jtag_pause_dr_o),
        .update_dr_o                (jtag_update_dr_o),
        .debug_select_o             (jtag_debug_select_o)
    );



    // CPU
    mor1kx #(
        .FEATURE_DEBUGUNIT          ("ENABLED"),
        .FEATURE_CMOV               ("ENABLED"),
        .FEATURE_INSTRUCTIONCACHE   ("ENABLED"),
        .OPTION_ICACHE_BLOCK_WIDTH  (5),
        .OPTION_ICACHE_SET_WIDTH    (8),
        .OPTION_ICACHE_WAYS         (2),
        .OPTION_ICACHE_LIMIT_WIDTH  (32),
        .FEATURE_IMMU               ("ENABLED"),
        .FEATURE_DATACACHE          ("ENABLED"),
        .OPTION_DCACHE_BLOCK_WIDTH  (5),
        .OPTION_DCACHE_SET_WIDTH    (8),
        .OPTION_DCACHE_WAYS         (2),
        .OPTION_DCACHE_LIMIT_WIDTH  (31),
        .FEATURE_DMMU               ("ENABLED"),
        .OPTION_PIC_TRIGGER         ("LATCHED_LEVEL"),
        .IBUS_WB_TYPE               ("B3_REGISTERED_FEEDBACK"),
        .DBUS_WB_TYPE               ("B3_REGISTERED_FEEDBACK"),
        .OPTION_CPU0                ("CAPPUCCINO"),
        .OPTION_RESET_PC            (32'hA000000)
    ) 
    cpu (
        // Clock
        .clk                        (wb_clk),

        // Reset
        .rst                        (cpu_rst),

        // CPU instruction Wishbone master
        .iwbm_adr_o                 (wb_m2s_cpu_i_adr),
        .iwbm_stb_o                 (wb_m2s_cpu_i_stb),
        .iwbm_cyc_o                 (wb_m2s_cpu_i_cyc),
        .iwbm_sel_o                 (wb_m2s_cpu_i_sel),
        .iwbm_we_o                  (wb_m2s_cpu_i_we),
        .iwbm_cti_o                 (wb_m2s_cpu_i_cti),
        .iwbm_bte_o                 (wb_m2s_cpu_i_bte),
        .iwbm_dat_o                 (wb_m2s_cpu_i_dat),
        .iwbm_err_i                 (wb_s2m_cpu_i_err),
        .iwbm_ack_i                 (wb_s2m_cpu_i_ack),
        .iwbm_dat_i                 (wb_s2m_cpu_i_dat),
        .iwbm_rty_i                 (wb_s2m_cpu_i_rty),

        // CPU data Wishbone master
        .dwbm_adr_o                 (wb_m2s_cpu_d_adr),
        .dwbm_stb_o                 (wb_m2s_cpu_d_stb),
        .dwbm_cyc_o                 (wb_m2s_cpu_d_cyc),
        .dwbm_sel_o                 (wb_m2s_cpu_d_sel),
        .dwbm_we_o                  (wb_m2s_cpu_d_we ),
        .dwbm_cti_o                 (wb_m2s_cpu_d_cti),
        .dwbm_bte_o                 (wb_m2s_cpu_d_bte),
        .dwbm_dat_o                 (wb_m2s_cpu_d_dat),
        .dwbm_err_i                 (wb_s2m_cpu_d_err),
        .dwbm_ack_i                 (wb_s2m_cpu_d_ack),
        .dwbm_dat_i                 (wb_s2m_cpu_d_dat),
        .dwbm_rty_i                 (wb_s2m_cpu_d_rty),

        // CPU interrupt receiver
        .irq_i                      (cpu_irq),

        // Debug unit connections
        .du_addr_i                  (cpu_dbg_adr_i[15:0]),
        .du_dat_i                   (cpu_dbg_dat_i),
        .du_stb_i                   (cpu_dbg_stb_i),
        .du_we_i                    (cpu_dbg_we_i),
        .du_stall_i                 (cpu_dbg_stall_i),
        .du_dat_o                   (cpu_dbg_dat_o),
        .du_ack_o                   (cpu_dbg_ack_o),
        .du_stall_o                 (cpu_dbg_bp_o),

        // Multicore options
        .multicore_coreid_i         (32'd0),
        .multicore_numcores_i       (32'd0),

        .snoop_adr_i                (32'd0),
        .snoop_en_i                 (1'b0),

        // Unused Avalon-MM data master
        .avm_d_address_o            (),
        .avm_d_byteenable_o         (),
        .avm_d_read_o               (),
        .avm_d_readdata_i           (32'h00000000),
        .avm_d_burstcount_o         (),
        .avm_d_write_o              (),
        .avm_d_writedata_o          (),
        .avm_d_waitrequest_i        (1'b0),
        .avm_d_readdatavalid_i      (1'b0),

        // Unused Avalon-MM instruction master
        .avm_i_address_o            (),
        .avm_i_byteenable_o         (),
        .avm_i_read_o               (),
        .avm_i_readdata_i           (32'h00000000),
        .avm_i_burstcount_o         (),
        .avm_i_waitrequest_i        (1'b0),
        .avm_i_readdatavalid_i      (1'b0),

        // Unused traceport
        .traceport_exec_valid_o     (),
        .traceport_exec_pc_o        (),
        .traceport_exec_insn_o      (),
        .traceport_exec_wbdata_o    (),
        .traceport_exec_wbreg_o     (),
        .traceport_exec_wben_o      (),
    );

    adbg_top cpu_dbg (
        // CPU interface
        .cpu0_clk_i                 (wb_clk),
        .cpu0_rst_o                 (cpu_dbg_rst),
        .cpu0_addr_o                (cpu_dbg_adr_i),
        .cpu0_data_o                (cpu_dbg_dat_i),
        .cpu0_stb_o                 (cpu_dbg_stb_i),
        .cpu0_we_o                  (cpu_dbg_we_i),
        .cpu0_data_i                (cpu_dbg_dat_o),
        .cpu0_ack_i                 (cpu_dbg_ack_o),
        .cpu0_stall_o               (cpu_dbg_stall_i),
        .cpu0_bp_i                  (cpu_dbg_bp_o),

        // JTAG interface
        .tck_i                      (jtag_tck_o),
        .tdi_i                      (jtag_tdi_o),
        .tdo_o                      (cpu_dbg_tdo_o),
        .rst_i                      (wb_rst),
        .capture_dr_i               (jtag_capture_dr_o),
        .shift_dr_i                 (jtag_shift_dr_o),
        .pause_dr_i                 (jtag_pause_dr_o),
        .update_dr_i                (jtag_update_dr_o),
        .debug_select_i             (jtag_debug_select_o),

        // Wishbone debug master
        .wb_clk_i                   (wb_clk),
        .wb_rst_i                   (wb_rst),
        .wb_dat_i                   (wb_s2m_cpu_dbg_dat),
        .wb_ack_i                   (wb_s2m_cpu_dbg_ack),
        .wb_err_i                   (wb_s2m_cpu_dbg_err),
        .wb_adr_o                   (wb_m2s_cpu_dbg_adr),
        .wb_dat_o                   (wb_m2s_cpu_dbg_dat),
        .wb_cyc_o                   (wb_m2s_cpu_dbg_cyc),
        .wb_stb_o                   (wb_m2s_cpu_dbg_stb),
        .wb_sel_o                   (wb_m2s_cpu_dbg_sel),
        .wb_we_o                    (wb_m2s_cpu_dbg_we),
        .wb_cab_o                   (),
        .wb_cti_o                   (wb_m2s_cpu_dbg_cti),
        .wb_bte_o                   (wb_m2s_cpu_dbg_bte),

        .wb_jsp_adr_i               (32'd0),
        .wb_jsp_dat_i               (32'd0),
        .wb_jsp_cyc_i               (1'b0),
        .wb_jsp_stb_i               (1'b0),
        .wb_jsp_sel_i               (4'h0),
        .wb_jsp_we_i                (1'b0),
        .wb_jsp_cab_i               (1'b0),
        .wb_jsp_cti_i               (3'd0),
        .wb_jsp_bte_i               (2'd0),
        .wb_jsp_dat_o               (),
        .wb_jsp_ack_o               (),
        .wb_jsp_err_o               (),

        .int_o                      ()
    );

    ddr3_interface ddr3_mem
    (
        .ddr3_pll_ref_clk           (DDR3_CLK_50MHZ),
        .global_reset_n             (ddr3_mem_global_reset_n),
        .soft_reset_n               (ddr3_mem_soft_reset_n),
        .afi_reset_n                (ddr3_mem_afi_reset_n),

        .ddr3_oct_rzqin_pad_i       (DDR3_OCT_RZQIN),
        .ddr3_a_pad_o               (DDR3_A),
        .ddr3_ba_pad_o              (DDR3_BA),
        .ddr3_cas_n_pad_o           (DDR3_CASn),
        .ddr3_clk_p_pad_o           (DDR3_CLK_P),
        .ddr3_clk_n_pad_o           (DDR3_CLK_N),
        .ddr3_cke_pad_o             (DDR3_CKE),
        .ddr3_cs_n_pad_o            (DDR3_CSn),
        .ddr3_dm_pad_o              (DDR3_DM),
        .ddr3_dq_pad_io             (DDR3_DQ),
        .ddr3_dqs_p_pad_io          (DDR3_DQS_P),
        .ddr3_dqs_n_pad_io          (DDR3_DQS_N),
        .ddr3_odt_pad_o             (DDR3_ODT),
        .ddr3_ras_n_pad_o           (DDR3_RASn),
        .ddr3_reset_n_pad_o         (DDR3_RESETn),
        .ddr3_we_n_pad_o            (DDR3_WEn),

        .wb_clk                     (wb_clk),
        .wb_rst                     (wb_rst),

        .wb0_adr_i                  (wb_m2s_ddr3_mem_port1_adr),
        .wb0_dat_i                  (wb_m2s_ddr3_mem_port1_dat),
        .wb0_stb_i                  (wb_m2s_ddr3_mem_port1_stb),
        .wb0_cyc_i                  (wb_m2s_ddr3_mem_port1_cyc),
        .wb0_cti_i                  (wb_m2s_ddr3_mem_port1_cti),
        .wb0_bte_i                  (wb_m2s_ddr3_mem_port1_bte),
        .wb0_we_i                   (wb_m2s_ddr3_mem_port1_we),
        .wb0_sel_i                  (wb_m2s_ddr3_mem_port1_sel),
        .wb0_dat_o                  (wb_s2m_ddr3_mem_port1_dat),
        .wb0_ack_o                  (wb_s2m_ddr3_mem_port1_ack),
        .wb0_err_o                  (wb_s2m_ddr3_mem_port1_err),
        .wb0_rty_o                  (wb_s2m_ddr3_mem_port1_rty),

        .wb1_adr_i                  (wb_m2s_ddr3_mem_port2_adr),
        .wb1_dat_i                  (wb_m2s_ddr3_mem_port2_dat),
        .wb1_stb_i                  (wb_m2s_ddr3_mem_port2_stb),
        .wb1_cyc_i                  (wb_m2s_ddr3_mem_port2_cyc),
        .wb1_cti_i                  (wb_m2s_ddr3_mem_port2_cti),
        .wb1_bte_i                  (wb_m2s_ddr3_mem_port2_bte),
        .wb1_we_i                   (wb_m2s_ddr3_mem_port2_we),
        .wb1_sel_i                  (wb_m2s_ddr3_mem_port2_sel),
        .wb1_dat_o                  (wb_s2m_ddr3_mem_port2_dat),
        .wb1_ack_o                  (wb_s2m_ddr3_mem_port2_ack),
        .wb1_err_o                  (wb_s2m_ddr3_mem_port2_err),
        .wb1_rty_o                  (wb_s2m_ddr3_mem_port2_rty)
    );


    simple_spi spi_flash_mem (
        // Wishbone slave interface
        .clk_i                      (wb_clk),
        .rst_i                      (wb_rst),
        .adr_i                      (wb_m2s_spi_flash_mem_adr[2:0]),
        .dat_i                      (wb_m2s_spi_flash_mem_dat),
        .we_i                       (wb_m2s_spi_flash_mem_we),
        .stb_i                      (wb_m2s_spi_flash_mem_stb),
        .cyc_i                      (wb_m2s_spi_flash_mem_cyc),
        .dat_o                      (wb_s2m_spi_flash_mem_dat),
        .ack_o                      (wb_s2m_spi_flash_mem_ack),

        // Outputs
        .inta_o                     (spi_flash_mem_irq),
        .sck_o                      (FPGA_DCLK),
        .ss_o                       (FPGA_nCSO),
        .mosi_o                     (FPGA_DATA0),

        // Inputs
        .miso_i                     (FPGA_DATA1)
    );

    rom #(
        .DATA_WIDTH                 (32),
        .ADDR_WIDTH                 (8),
        .INIT_FILE                  ("./mem_init/rom.hex")
    )
    boot_rom (
        // Wishbone slave interface
        .clk_i                      (wb_clk),
        .rst_i                      (wb_rst),
        .adr_i                      (wb_m2s_spi_flash_mem_adr),
        .stb_i                      (wb_m2s_spi_flash_mem_stb),
        .cyc_i                      (wb_m2s_spi_flash_mem_cyc),
        .dat_o                      (wb_s2m_spi_flash_mem_dat),
        .ack_o                      (wb_s2m_spi_flash_mem_ack)
    );


    assign ENET_MDIO = eth0_md_pad_oe ? eth0_md_pad_o : 1'bz;

    ethmac eth0 (
        .wb_clk_i                   (wb_clk),
        .wb_rst_i                   (wb_rst),
        .wb_adr_i                   (wb_m2s_eth0_adr[11:2]),
        .wb_dat_i                   (wb_m2s_eth0_dat),
        .wb_sel_i                   (wb_m2s_eth0_sel),
        .wb_we_i                    (wb_m2s_eth0_we),
        .wb_cyc_i                   (wb_m2s_eth0_cyc),
        .wb_stb_i                   (wb_m2s_eth0_stb),
        .wb_dat_o                   (wb_s2m_eth0_dat),
        .wb_err_o                   (wb_s2m_eth0_err),
        .wb_ack_o                   (wb_s2m_eth0_ack),

        .m_wb_adr_o                 (wb_m2s_eth0_master_adr),
        .m_wb_sel_o                 (wb_m2s_eth0_master_sel),
        .m_wb_we_o                  (wb_m2s_eth0_master_we),
        .m_wb_dat_o                 (wb_m2s_eth0_master_dat),
        .m_wb_cyc_o                 (wb_m2s_eth0_master_cyc),
        .m_wb_stb_o                 (wb_m2s_eth0_master_stb),
        .m_wb_cti_o                 (wb_m2s_eth0_master_cti),
        .m_wb_bte_o                 (wb_m2s_eth0_master_bte),
        .m_wb_dat_i                 (wb_s2m_eth0_master_dat),
        .m_wb_ack_i                 (wb_s2m_eth0_master_ack),
        .m_wb_err_i                 (wb_s2m_eth0_master_err),

        // Ethernet MII interface
        // Transmit
        .mtxd_pad_o                 (eth0_mtxd_pad_o),
        .mtxen_pad_o                (eth0_mtxen_pad_o),
        .mtxerr_pad_o               (eth0_mtxerr_pad_o),
        .mtx_clk_pad_i              (eth0_mtx_clk_pad_i),

        // Receive
        .mrx_clk_pad_i              (eth0_mrx_clk_pad_i),
        .mrxd_pad_i                 (eth0_mrxd_pad_i),
        .mrxdv_pad_i                (eth0_mrxdv_pad_i),
        .mrxerr_pad_i               (eth0_mrxerr_pad_i),
        .mcoll_pad_i                (eth0_mcoll_pad_i),
        .mcrs_pad_i                 (eth0_mcrs_pad_i),

        // Management interface
        .md_pad_i                   (ENET_MDIO),
        .mdc_pad_o                  (ENET_MDC),
        .md_pad_o                   (eth0_md_pad_o),
        .md_padoe_o                 (eth0_md_pad_oe),

        // Processor interrupt
        .int_o                      (eth0_int_o)
    );


    mii_to_rgmii_adapter mii_to_rgmii (
        .rst                        (wb_rst),
        .clk_int_25mhz              (eth_25mhz_clk),
        .clk_int_2500khz            (eth_2500khz_clk),
        .clk_ext_25mhz              (eth_25mhz_90deg_clk),
        .clk_ext_2500khz            (eth_2500khz_90deg_clk),
        .eth_10mbps                 (1'b0),
        .rgmii_rx_clk               (ENET_RX_CLK),
        .rgmii_gtx_clk              (ENET_GTX_CLK),
        .rgmii_tx_en                (ENET_TX_EN),
        .rgmii_rx_dv                (ENET_RX_DV),
        .rgmii_txd                  (ENET_TXD),
        .rgmii_rxd                  (ENET_RXD),
        .mii_rx_clk                 (eth0_mrx_clk_pad_i),
        .mii_rxd                    (eth0_mrxd_pad_i),
        .mii_rx_dv                  (eth0_mrxdv_pad_i),
        .mii_rx_er                  (eth0_mrxerr_pad_i),
        .mii_col                    (eth0_mcoll_pad_i),
        .mii_crs                    (eth0_mcrs_pad_i),
        .mii_txd                    (eth0_mtxd_pad_o),
        .mii_tx_en                  (eth0_mtxen_pad_o),
        .mii_tx_er                  (eth0_mtxerr_pad_o),
        .mii_tx_clk                 (eth0_mtx_clk_pad_i)

    );

endmodule

