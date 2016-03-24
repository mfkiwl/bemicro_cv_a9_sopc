// THIS FILE IS AUTOGENERATED BY wb_intercon_gen
// ANY MANUAL CHANGES WILL BE LOST
module wb_intercon
   (input         wb_clk_i,
    input         wb_rst_i,
    input  [31:0] wb_cpu_i_adr_i,
    input  [31:0] wb_cpu_i_dat_i,
    input   [3:0] wb_cpu_i_sel_i,
    input         wb_cpu_i_we_i,
    input         wb_cpu_i_cyc_i,
    input         wb_cpu_i_stb_i,
    input   [2:0] wb_cpu_i_cti_i,
    input   [1:0] wb_cpu_i_bte_i,
    output [31:0] wb_cpu_i_dat_o,
    output        wb_cpu_i_ack_o,
    output        wb_cpu_i_err_o,
    output        wb_cpu_i_rty_o,
    input  [31:0] wb_cpu_d_adr_i,
    input  [31:0] wb_cpu_d_dat_i,
    input   [3:0] wb_cpu_d_sel_i,
    input         wb_cpu_d_we_i,
    input         wb_cpu_d_cyc_i,
    input         wb_cpu_d_stb_i,
    input   [2:0] wb_cpu_d_cti_i,
    input   [1:0] wb_cpu_d_bte_i,
    output [31:0] wb_cpu_d_dat_o,
    output        wb_cpu_d_ack_o,
    output        wb_cpu_d_err_o,
    output        wb_cpu_d_rty_o,
    input  [31:0] wb_dbg_adr_i,
    input  [31:0] wb_dbg_dat_i,
    input   [3:0] wb_dbg_sel_i,
    input         wb_dbg_we_i,
    input         wb_dbg_cyc_i,
    input         wb_dbg_stb_i,
    input   [2:0] wb_dbg_cti_i,
    input   [1:0] wb_dbg_bte_i,
    output [31:0] wb_dbg_dat_o,
    output        wb_dbg_ack_o,
    output        wb_dbg_err_o,
    output        wb_dbg_rty_o,
    input  [31:0] wb_eth0_master_adr_i,
    input  [31:0] wb_eth0_master_dat_i,
    input   [3:0] wb_eth0_master_sel_i,
    input         wb_eth0_master_we_i,
    input         wb_eth0_master_cyc_i,
    input         wb_eth0_master_stb_i,
    input   [2:0] wb_eth0_master_cti_i,
    input   [1:0] wb_eth0_master_bte_i,
    output [31:0] wb_eth0_master_dat_o,
    output        wb_eth0_master_ack_o,
    output        wb_eth0_master_err_o,
    output        wb_eth0_master_rty_o,
    output [31:0] wb_ddr3_mem_port1_adr_o,
    output [31:0] wb_ddr3_mem_port1_dat_o,
    output  [3:0] wb_ddr3_mem_port1_sel_o,
    output        wb_ddr3_mem_port1_we_o,
    output        wb_ddr3_mem_port1_cyc_o,
    output        wb_ddr3_mem_port1_stb_o,
    output  [2:0] wb_ddr3_mem_port1_cti_o,
    output  [1:0] wb_ddr3_mem_port1_bte_o,
    input  [31:0] wb_ddr3_mem_port1_dat_i,
    input         wb_ddr3_mem_port1_ack_i,
    input         wb_ddr3_mem_port1_err_i,
    input         wb_ddr3_mem_port1_rty_i,
    output [31:0] wb_ddr3_mem_port2_adr_o,
    output [31:0] wb_ddr3_mem_port2_dat_o,
    output  [3:0] wb_ddr3_mem_port2_sel_o,
    output        wb_ddr3_mem_port2_we_o,
    output        wb_ddr3_mem_port2_cyc_o,
    output        wb_ddr3_mem_port2_stb_o,
    output  [2:0] wb_ddr3_mem_port2_cti_o,
    output  [1:0] wb_ddr3_mem_port2_bte_o,
    input  [31:0] wb_ddr3_mem_port2_dat_i,
    input         wb_ddr3_mem_port2_ack_i,
    input         wb_ddr3_mem_port2_err_i,
    input         wb_ddr3_mem_port2_rty_i,
    output [31:0] wb_qspi_flash_mem_adr_o,
    output [31:0] wb_qspi_flash_mem_dat_o,
    output  [3:0] wb_qspi_flash_mem_sel_o,
    output        wb_qspi_flash_mem_we_o,
    output        wb_qspi_flash_mem_cyc_o,
    output        wb_qspi_flash_mem_stb_o,
    output  [2:0] wb_qspi_flash_mem_cti_o,
    output  [1:0] wb_qspi_flash_mem_bte_o,
    input  [31:0] wb_qspi_flash_mem_dat_i,
    input         wb_qspi_flash_mem_ack_i,
    input         wb_qspi_flash_mem_err_i,
    input         wb_qspi_flash_mem_rty_i,
    output [31:0] wb_oc_mem_adr_o,
    output [31:0] wb_oc_mem_dat_o,
    output  [3:0] wb_oc_mem_sel_o,
    output        wb_oc_mem_we_o,
    output        wb_oc_mem_cyc_o,
    output        wb_oc_mem_stb_o,
    output  [2:0] wb_oc_mem_cti_o,
    output  [1:0] wb_oc_mem_bte_o,
    input  [31:0] wb_oc_mem_dat_i,
    input         wb_oc_mem_ack_i,
    input         wb_oc_mem_err_i,
    input         wb_oc_mem_rty_i,
    output [31:0] wb_eth0_adr_o,
    output [31:0] wb_eth0_dat_o,
    output  [3:0] wb_eth0_sel_o,
    output        wb_eth0_we_o,
    output        wb_eth0_cyc_o,
    output        wb_eth0_stb_o,
    output  [2:0] wb_eth0_cti_o,
    output  [1:0] wb_eth0_bte_o,
    input  [31:0] wb_eth0_dat_i,
    input         wb_eth0_ack_i,
    input         wb_eth0_err_i,
    input         wb_eth0_rty_i);

wire [31:0] wb_m2s_cpu_i_oc_mem_adr;
wire [31:0] wb_m2s_cpu_i_oc_mem_dat;
wire  [3:0] wb_m2s_cpu_i_oc_mem_sel;
wire        wb_m2s_cpu_i_oc_mem_we;
wire        wb_m2s_cpu_i_oc_mem_cyc;
wire        wb_m2s_cpu_i_oc_mem_stb;
wire  [2:0] wb_m2s_cpu_i_oc_mem_cti;
wire  [1:0] wb_m2s_cpu_i_oc_mem_bte;
wire [31:0] wb_s2m_cpu_i_oc_mem_dat;
wire        wb_s2m_cpu_i_oc_mem_ack;
wire        wb_s2m_cpu_i_oc_mem_err;
wire        wb_s2m_cpu_i_oc_mem_rty;
wire [31:0] wb_m2s_cpu_i_qspi_flash_mem_adr;
wire [31:0] wb_m2s_cpu_i_qspi_flash_mem_dat;
wire  [3:0] wb_m2s_cpu_i_qspi_flash_mem_sel;
wire        wb_m2s_cpu_i_qspi_flash_mem_we;
wire        wb_m2s_cpu_i_qspi_flash_mem_cyc;
wire        wb_m2s_cpu_i_qspi_flash_mem_stb;
wire  [2:0] wb_m2s_cpu_i_qspi_flash_mem_cti;
wire  [1:0] wb_m2s_cpu_i_qspi_flash_mem_bte;
wire [31:0] wb_s2m_cpu_i_qspi_flash_mem_dat;
wire        wb_s2m_cpu_i_qspi_flash_mem_ack;
wire        wb_s2m_cpu_i_qspi_flash_mem_err;
wire        wb_s2m_cpu_i_qspi_flash_mem_rty;
wire [31:0] wb_m2s_cpu_d_ddr3_mem_port1_adr;
wire [31:0] wb_m2s_cpu_d_ddr3_mem_port1_dat;
wire  [3:0] wb_m2s_cpu_d_ddr3_mem_port1_sel;
wire        wb_m2s_cpu_d_ddr3_mem_port1_we;
wire        wb_m2s_cpu_d_ddr3_mem_port1_cyc;
wire        wb_m2s_cpu_d_ddr3_mem_port1_stb;
wire  [2:0] wb_m2s_cpu_d_ddr3_mem_port1_cti;
wire  [1:0] wb_m2s_cpu_d_ddr3_mem_port1_bte;
wire [31:0] wb_s2m_cpu_d_ddr3_mem_port1_dat;
wire        wb_s2m_cpu_d_ddr3_mem_port1_ack;
wire        wb_s2m_cpu_d_ddr3_mem_port1_err;
wire        wb_s2m_cpu_d_ddr3_mem_port1_rty;
wire [31:0] wb_m2s_cpu_d_oc_mem_adr;
wire [31:0] wb_m2s_cpu_d_oc_mem_dat;
wire  [3:0] wb_m2s_cpu_d_oc_mem_sel;
wire        wb_m2s_cpu_d_oc_mem_we;
wire        wb_m2s_cpu_d_oc_mem_cyc;
wire        wb_m2s_cpu_d_oc_mem_stb;
wire  [2:0] wb_m2s_cpu_d_oc_mem_cti;
wire  [1:0] wb_m2s_cpu_d_oc_mem_bte;
wire [31:0] wb_s2m_cpu_d_oc_mem_dat;
wire        wb_s2m_cpu_d_oc_mem_ack;
wire        wb_s2m_cpu_d_oc_mem_err;
wire        wb_s2m_cpu_d_oc_mem_rty;
wire [31:0] wb_m2s_cpu_d_qspi_flash_mem_adr;
wire [31:0] wb_m2s_cpu_d_qspi_flash_mem_dat;
wire  [3:0] wb_m2s_cpu_d_qspi_flash_mem_sel;
wire        wb_m2s_cpu_d_qspi_flash_mem_we;
wire        wb_m2s_cpu_d_qspi_flash_mem_cyc;
wire        wb_m2s_cpu_d_qspi_flash_mem_stb;
wire  [2:0] wb_m2s_cpu_d_qspi_flash_mem_cti;
wire  [1:0] wb_m2s_cpu_d_qspi_flash_mem_bte;
wire [31:0] wb_s2m_cpu_d_qspi_flash_mem_dat;
wire        wb_s2m_cpu_d_qspi_flash_mem_ack;
wire        wb_s2m_cpu_d_qspi_flash_mem_err;
wire        wb_s2m_cpu_d_qspi_flash_mem_rty;
wire [31:0] wb_m2s_dbg_ddr3_mem_port1_adr;
wire [31:0] wb_m2s_dbg_ddr3_mem_port1_dat;
wire  [3:0] wb_m2s_dbg_ddr3_mem_port1_sel;
wire        wb_m2s_dbg_ddr3_mem_port1_we;
wire        wb_m2s_dbg_ddr3_mem_port1_cyc;
wire        wb_m2s_dbg_ddr3_mem_port1_stb;
wire  [2:0] wb_m2s_dbg_ddr3_mem_port1_cti;
wire  [1:0] wb_m2s_dbg_ddr3_mem_port1_bte;
wire [31:0] wb_s2m_dbg_ddr3_mem_port1_dat;
wire        wb_s2m_dbg_ddr3_mem_port1_ack;
wire        wb_s2m_dbg_ddr3_mem_port1_err;
wire        wb_s2m_dbg_ddr3_mem_port1_rty;
wire [31:0] wb_m2s_dbg_oc_mem_adr;
wire [31:0] wb_m2s_dbg_oc_mem_dat;
wire  [3:0] wb_m2s_dbg_oc_mem_sel;
wire        wb_m2s_dbg_oc_mem_we;
wire        wb_m2s_dbg_oc_mem_cyc;
wire        wb_m2s_dbg_oc_mem_stb;
wire  [2:0] wb_m2s_dbg_oc_mem_cti;
wire  [1:0] wb_m2s_dbg_oc_mem_bte;
wire [31:0] wb_s2m_dbg_oc_mem_dat;
wire        wb_s2m_dbg_oc_mem_ack;
wire        wb_s2m_dbg_oc_mem_err;
wire        wb_s2m_dbg_oc_mem_rty;
wire [31:0] wb_m2s_dbg_qspi_flash_mem_adr;
wire [31:0] wb_m2s_dbg_qspi_flash_mem_dat;
wire  [3:0] wb_m2s_dbg_qspi_flash_mem_sel;
wire        wb_m2s_dbg_qspi_flash_mem_we;
wire        wb_m2s_dbg_qspi_flash_mem_cyc;
wire        wb_m2s_dbg_qspi_flash_mem_stb;
wire  [2:0] wb_m2s_dbg_qspi_flash_mem_cti;
wire  [1:0] wb_m2s_dbg_qspi_flash_mem_bte;
wire [31:0] wb_s2m_dbg_qspi_flash_mem_dat;
wire        wb_s2m_dbg_qspi_flash_mem_ack;
wire        wb_s2m_dbg_qspi_flash_mem_err;
wire        wb_s2m_dbg_qspi_flash_mem_rty;
wire [31:0] wb_m2s_eth0_master_ddr3_mem_port1_adr;
wire [31:0] wb_m2s_eth0_master_ddr3_mem_port1_dat;
wire  [3:0] wb_m2s_eth0_master_ddr3_mem_port1_sel;
wire        wb_m2s_eth0_master_ddr3_mem_port1_we;
wire        wb_m2s_eth0_master_ddr3_mem_port1_cyc;
wire        wb_m2s_eth0_master_ddr3_mem_port1_stb;
wire  [2:0] wb_m2s_eth0_master_ddr3_mem_port1_cti;
wire  [1:0] wb_m2s_eth0_master_ddr3_mem_port1_bte;
wire [31:0] wb_s2m_eth0_master_ddr3_mem_port1_dat;
wire        wb_s2m_eth0_master_ddr3_mem_port1_ack;
wire        wb_s2m_eth0_master_ddr3_mem_port1_err;
wire        wb_s2m_eth0_master_ddr3_mem_port1_rty;

wb_mux
  #(.num_slaves (3),
    .MATCH_ADDR ({32'h00000000, 32'h0a000000, 32'h08000000}),
    .MATCH_MASK ({32'hf8000000, 32'hfffe0000, 32'hfe000000}))
 wb_mux_cpu_i
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i (wb_cpu_i_adr_i),
    .wbm_dat_i (wb_cpu_i_dat_i),
    .wbm_sel_i (wb_cpu_i_sel_i),
    .wbm_we_i  (wb_cpu_i_we_i),
    .wbm_cyc_i (wb_cpu_i_cyc_i),
    .wbm_stb_i (wb_cpu_i_stb_i),
    .wbm_cti_i (wb_cpu_i_cti_i),
    .wbm_bte_i (wb_cpu_i_bte_i),
    .wbm_dat_o (wb_cpu_i_dat_o),
    .wbm_ack_o (wb_cpu_i_ack_o),
    .wbm_err_o (wb_cpu_i_err_o),
    .wbm_rty_o (wb_cpu_i_rty_o),
    .wbs_adr_o ({wb_ddr3_mem_port2_adr_o, wb_m2s_cpu_i_oc_mem_adr, wb_m2s_cpu_i_qspi_flash_mem_adr}),
    .wbs_dat_o ({wb_ddr3_mem_port2_dat_o, wb_m2s_cpu_i_oc_mem_dat, wb_m2s_cpu_i_qspi_flash_mem_dat}),
    .wbs_sel_o ({wb_ddr3_mem_port2_sel_o, wb_m2s_cpu_i_oc_mem_sel, wb_m2s_cpu_i_qspi_flash_mem_sel}),
    .wbs_we_o  ({wb_ddr3_mem_port2_we_o, wb_m2s_cpu_i_oc_mem_we, wb_m2s_cpu_i_qspi_flash_mem_we}),
    .wbs_cyc_o ({wb_ddr3_mem_port2_cyc_o, wb_m2s_cpu_i_oc_mem_cyc, wb_m2s_cpu_i_qspi_flash_mem_cyc}),
    .wbs_stb_o ({wb_ddr3_mem_port2_stb_o, wb_m2s_cpu_i_oc_mem_stb, wb_m2s_cpu_i_qspi_flash_mem_stb}),
    .wbs_cti_o ({wb_ddr3_mem_port2_cti_o, wb_m2s_cpu_i_oc_mem_cti, wb_m2s_cpu_i_qspi_flash_mem_cti}),
    .wbs_bte_o ({wb_ddr3_mem_port2_bte_o, wb_m2s_cpu_i_oc_mem_bte, wb_m2s_cpu_i_qspi_flash_mem_bte}),
    .wbs_dat_i ({wb_ddr3_mem_port2_dat_i, wb_s2m_cpu_i_oc_mem_dat, wb_s2m_cpu_i_qspi_flash_mem_dat}),
    .wbs_ack_i ({wb_ddr3_mem_port2_ack_i, wb_s2m_cpu_i_oc_mem_ack, wb_s2m_cpu_i_qspi_flash_mem_ack}),
    .wbs_err_i ({wb_ddr3_mem_port2_err_i, wb_s2m_cpu_i_oc_mem_err, wb_s2m_cpu_i_qspi_flash_mem_err}),
    .wbs_rty_i ({wb_ddr3_mem_port2_rty_i, wb_s2m_cpu_i_oc_mem_rty, wb_s2m_cpu_i_qspi_flash_mem_rty}));

wb_mux
  #(.num_slaves (4),
    .MATCH_ADDR ({32'h00000000, 32'h0a000000, 32'h08000000, 32'h10000000}),
    .MATCH_MASK ({32'hf8000000, 32'hfffe0000, 32'hfe000000, 32'hffff0000}))
 wb_mux_cpu_d
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i (wb_cpu_d_adr_i),
    .wbm_dat_i (wb_cpu_d_dat_i),
    .wbm_sel_i (wb_cpu_d_sel_i),
    .wbm_we_i  (wb_cpu_d_we_i),
    .wbm_cyc_i (wb_cpu_d_cyc_i),
    .wbm_stb_i (wb_cpu_d_stb_i),
    .wbm_cti_i (wb_cpu_d_cti_i),
    .wbm_bte_i (wb_cpu_d_bte_i),
    .wbm_dat_o (wb_cpu_d_dat_o),
    .wbm_ack_o (wb_cpu_d_ack_o),
    .wbm_err_o (wb_cpu_d_err_o),
    .wbm_rty_o (wb_cpu_d_rty_o),
    .wbs_adr_o ({wb_m2s_cpu_d_ddr3_mem_port1_adr, wb_m2s_cpu_d_oc_mem_adr, wb_m2s_cpu_d_qspi_flash_mem_adr, wb_eth0_adr_o}),
    .wbs_dat_o ({wb_m2s_cpu_d_ddr3_mem_port1_dat, wb_m2s_cpu_d_oc_mem_dat, wb_m2s_cpu_d_qspi_flash_mem_dat, wb_eth0_dat_o}),
    .wbs_sel_o ({wb_m2s_cpu_d_ddr3_mem_port1_sel, wb_m2s_cpu_d_oc_mem_sel, wb_m2s_cpu_d_qspi_flash_mem_sel, wb_eth0_sel_o}),
    .wbs_we_o  ({wb_m2s_cpu_d_ddr3_mem_port1_we, wb_m2s_cpu_d_oc_mem_we, wb_m2s_cpu_d_qspi_flash_mem_we, wb_eth0_we_o}),
    .wbs_cyc_o ({wb_m2s_cpu_d_ddr3_mem_port1_cyc, wb_m2s_cpu_d_oc_mem_cyc, wb_m2s_cpu_d_qspi_flash_mem_cyc, wb_eth0_cyc_o}),
    .wbs_stb_o ({wb_m2s_cpu_d_ddr3_mem_port1_stb, wb_m2s_cpu_d_oc_mem_stb, wb_m2s_cpu_d_qspi_flash_mem_stb, wb_eth0_stb_o}),
    .wbs_cti_o ({wb_m2s_cpu_d_ddr3_mem_port1_cti, wb_m2s_cpu_d_oc_mem_cti, wb_m2s_cpu_d_qspi_flash_mem_cti, wb_eth0_cti_o}),
    .wbs_bte_o ({wb_m2s_cpu_d_ddr3_mem_port1_bte, wb_m2s_cpu_d_oc_mem_bte, wb_m2s_cpu_d_qspi_flash_mem_bte, wb_eth0_bte_o}),
    .wbs_dat_i ({wb_s2m_cpu_d_ddr3_mem_port1_dat, wb_s2m_cpu_d_oc_mem_dat, wb_s2m_cpu_d_qspi_flash_mem_dat, wb_eth0_dat_i}),
    .wbs_ack_i ({wb_s2m_cpu_d_ddr3_mem_port1_ack, wb_s2m_cpu_d_oc_mem_ack, wb_s2m_cpu_d_qspi_flash_mem_ack, wb_eth0_ack_i}),
    .wbs_err_i ({wb_s2m_cpu_d_ddr3_mem_port1_err, wb_s2m_cpu_d_oc_mem_err, wb_s2m_cpu_d_qspi_flash_mem_err, wb_eth0_err_i}),
    .wbs_rty_i ({wb_s2m_cpu_d_ddr3_mem_port1_rty, wb_s2m_cpu_d_oc_mem_rty, wb_s2m_cpu_d_qspi_flash_mem_rty, wb_eth0_rty_i}));

wb_mux
  #(.num_slaves (3),
    .MATCH_ADDR ({32'h00000000, 32'h0a000000, 32'h08000000}),
    .MATCH_MASK ({32'hf8000000, 32'hfffe0000, 32'hfe000000}))
 wb_mux_dbg
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i (wb_dbg_adr_i),
    .wbm_dat_i (wb_dbg_dat_i),
    .wbm_sel_i (wb_dbg_sel_i),
    .wbm_we_i  (wb_dbg_we_i),
    .wbm_cyc_i (wb_dbg_cyc_i),
    .wbm_stb_i (wb_dbg_stb_i),
    .wbm_cti_i (wb_dbg_cti_i),
    .wbm_bte_i (wb_dbg_bte_i),
    .wbm_dat_o (wb_dbg_dat_o),
    .wbm_ack_o (wb_dbg_ack_o),
    .wbm_err_o (wb_dbg_err_o),
    .wbm_rty_o (wb_dbg_rty_o),
    .wbs_adr_o ({wb_m2s_dbg_ddr3_mem_port1_adr, wb_m2s_dbg_oc_mem_adr, wb_m2s_dbg_qspi_flash_mem_adr}),
    .wbs_dat_o ({wb_m2s_dbg_ddr3_mem_port1_dat, wb_m2s_dbg_oc_mem_dat, wb_m2s_dbg_qspi_flash_mem_dat}),
    .wbs_sel_o ({wb_m2s_dbg_ddr3_mem_port1_sel, wb_m2s_dbg_oc_mem_sel, wb_m2s_dbg_qspi_flash_mem_sel}),
    .wbs_we_o  ({wb_m2s_dbg_ddr3_mem_port1_we, wb_m2s_dbg_oc_mem_we, wb_m2s_dbg_qspi_flash_mem_we}),
    .wbs_cyc_o ({wb_m2s_dbg_ddr3_mem_port1_cyc, wb_m2s_dbg_oc_mem_cyc, wb_m2s_dbg_qspi_flash_mem_cyc}),
    .wbs_stb_o ({wb_m2s_dbg_ddr3_mem_port1_stb, wb_m2s_dbg_oc_mem_stb, wb_m2s_dbg_qspi_flash_mem_stb}),
    .wbs_cti_o ({wb_m2s_dbg_ddr3_mem_port1_cti, wb_m2s_dbg_oc_mem_cti, wb_m2s_dbg_qspi_flash_mem_cti}),
    .wbs_bte_o ({wb_m2s_dbg_ddr3_mem_port1_bte, wb_m2s_dbg_oc_mem_bte, wb_m2s_dbg_qspi_flash_mem_bte}),
    .wbs_dat_i ({wb_s2m_dbg_ddr3_mem_port1_dat, wb_s2m_dbg_oc_mem_dat, wb_s2m_dbg_qspi_flash_mem_dat}),
    .wbs_ack_i ({wb_s2m_dbg_ddr3_mem_port1_ack, wb_s2m_dbg_oc_mem_ack, wb_s2m_dbg_qspi_flash_mem_ack}),
    .wbs_err_i ({wb_s2m_dbg_ddr3_mem_port1_err, wb_s2m_dbg_oc_mem_err, wb_s2m_dbg_qspi_flash_mem_err}),
    .wbs_rty_i ({wb_s2m_dbg_ddr3_mem_port1_rty, wb_s2m_dbg_oc_mem_rty, wb_s2m_dbg_qspi_flash_mem_rty}));

wb_mux
  #(.num_slaves (1),
    .MATCH_ADDR ({32'h00000000}),
    .MATCH_MASK ({32'hf8000000}))
 wb_mux_eth0_master
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i (wb_eth0_master_adr_i),
    .wbm_dat_i (wb_eth0_master_dat_i),
    .wbm_sel_i (wb_eth0_master_sel_i),
    .wbm_we_i  (wb_eth0_master_we_i),
    .wbm_cyc_i (wb_eth0_master_cyc_i),
    .wbm_stb_i (wb_eth0_master_stb_i),
    .wbm_cti_i (wb_eth0_master_cti_i),
    .wbm_bte_i (wb_eth0_master_bte_i),
    .wbm_dat_o (wb_eth0_master_dat_o),
    .wbm_ack_o (wb_eth0_master_ack_o),
    .wbm_err_o (wb_eth0_master_err_o),
    .wbm_rty_o (wb_eth0_master_rty_o),
    .wbs_adr_o ({wb_m2s_eth0_master_ddr3_mem_port1_adr}),
    .wbs_dat_o ({wb_m2s_eth0_master_ddr3_mem_port1_dat}),
    .wbs_sel_o ({wb_m2s_eth0_master_ddr3_mem_port1_sel}),
    .wbs_we_o  ({wb_m2s_eth0_master_ddr3_mem_port1_we}),
    .wbs_cyc_o ({wb_m2s_eth0_master_ddr3_mem_port1_cyc}),
    .wbs_stb_o ({wb_m2s_eth0_master_ddr3_mem_port1_stb}),
    .wbs_cti_o ({wb_m2s_eth0_master_ddr3_mem_port1_cti}),
    .wbs_bte_o ({wb_m2s_eth0_master_ddr3_mem_port1_bte}),
    .wbs_dat_i ({wb_s2m_eth0_master_ddr3_mem_port1_dat}),
    .wbs_ack_i ({wb_s2m_eth0_master_ddr3_mem_port1_ack}),
    .wbs_err_i ({wb_s2m_eth0_master_ddr3_mem_port1_err}),
    .wbs_rty_i ({wb_s2m_eth0_master_ddr3_mem_port1_rty}));

wb_arbiter
  #(.num_masters (3))
 wb_arbiter_ddr3_mem_port1
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i ({wb_m2s_cpu_d_ddr3_mem_port1_adr, wb_m2s_dbg_ddr3_mem_port1_adr, wb_m2s_eth0_master_ddr3_mem_port1_adr}),
    .wbm_dat_i ({wb_m2s_cpu_d_ddr3_mem_port1_dat, wb_m2s_dbg_ddr3_mem_port1_dat, wb_m2s_eth0_master_ddr3_mem_port1_dat}),
    .wbm_sel_i ({wb_m2s_cpu_d_ddr3_mem_port1_sel, wb_m2s_dbg_ddr3_mem_port1_sel, wb_m2s_eth0_master_ddr3_mem_port1_sel}),
    .wbm_we_i  ({wb_m2s_cpu_d_ddr3_mem_port1_we, wb_m2s_dbg_ddr3_mem_port1_we, wb_m2s_eth0_master_ddr3_mem_port1_we}),
    .wbm_cyc_i ({wb_m2s_cpu_d_ddr3_mem_port1_cyc, wb_m2s_dbg_ddr3_mem_port1_cyc, wb_m2s_eth0_master_ddr3_mem_port1_cyc}),
    .wbm_stb_i ({wb_m2s_cpu_d_ddr3_mem_port1_stb, wb_m2s_dbg_ddr3_mem_port1_stb, wb_m2s_eth0_master_ddr3_mem_port1_stb}),
    .wbm_cti_i ({wb_m2s_cpu_d_ddr3_mem_port1_cti, wb_m2s_dbg_ddr3_mem_port1_cti, wb_m2s_eth0_master_ddr3_mem_port1_cti}),
    .wbm_bte_i ({wb_m2s_cpu_d_ddr3_mem_port1_bte, wb_m2s_dbg_ddr3_mem_port1_bte, wb_m2s_eth0_master_ddr3_mem_port1_bte}),
    .wbm_dat_o ({wb_s2m_cpu_d_ddr3_mem_port1_dat, wb_s2m_dbg_ddr3_mem_port1_dat, wb_s2m_eth0_master_ddr3_mem_port1_dat}),
    .wbm_ack_o ({wb_s2m_cpu_d_ddr3_mem_port1_ack, wb_s2m_dbg_ddr3_mem_port1_ack, wb_s2m_eth0_master_ddr3_mem_port1_ack}),
    .wbm_err_o ({wb_s2m_cpu_d_ddr3_mem_port1_err, wb_s2m_dbg_ddr3_mem_port1_err, wb_s2m_eth0_master_ddr3_mem_port1_err}),
    .wbm_rty_o ({wb_s2m_cpu_d_ddr3_mem_port1_rty, wb_s2m_dbg_ddr3_mem_port1_rty, wb_s2m_eth0_master_ddr3_mem_port1_rty}),
    .wbs_adr_o (wb_ddr3_mem_port1_adr_o),
    .wbs_dat_o (wb_ddr3_mem_port1_dat_o),
    .wbs_sel_o (wb_ddr3_mem_port1_sel_o),
    .wbs_we_o  (wb_ddr3_mem_port1_we_o),
    .wbs_cyc_o (wb_ddr3_mem_port1_cyc_o),
    .wbs_stb_o (wb_ddr3_mem_port1_stb_o),
    .wbs_cti_o (wb_ddr3_mem_port1_cti_o),
    .wbs_bte_o (wb_ddr3_mem_port1_bte_o),
    .wbs_dat_i (wb_ddr3_mem_port1_dat_i),
    .wbs_ack_i (wb_ddr3_mem_port1_ack_i),
    .wbs_err_i (wb_ddr3_mem_port1_err_i),
    .wbs_rty_i (wb_ddr3_mem_port1_rty_i));

wb_arbiter
  #(.num_masters (3))
 wb_arbiter_qspi_flash_mem
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i ({wb_m2s_cpu_i_qspi_flash_mem_adr, wb_m2s_cpu_d_qspi_flash_mem_adr, wb_m2s_dbg_qspi_flash_mem_adr}),
    .wbm_dat_i ({wb_m2s_cpu_i_qspi_flash_mem_dat, wb_m2s_cpu_d_qspi_flash_mem_dat, wb_m2s_dbg_qspi_flash_mem_dat}),
    .wbm_sel_i ({wb_m2s_cpu_i_qspi_flash_mem_sel, wb_m2s_cpu_d_qspi_flash_mem_sel, wb_m2s_dbg_qspi_flash_mem_sel}),
    .wbm_we_i  ({wb_m2s_cpu_i_qspi_flash_mem_we, wb_m2s_cpu_d_qspi_flash_mem_we, wb_m2s_dbg_qspi_flash_mem_we}),
    .wbm_cyc_i ({wb_m2s_cpu_i_qspi_flash_mem_cyc, wb_m2s_cpu_d_qspi_flash_mem_cyc, wb_m2s_dbg_qspi_flash_mem_cyc}),
    .wbm_stb_i ({wb_m2s_cpu_i_qspi_flash_mem_stb, wb_m2s_cpu_d_qspi_flash_mem_stb, wb_m2s_dbg_qspi_flash_mem_stb}),
    .wbm_cti_i ({wb_m2s_cpu_i_qspi_flash_mem_cti, wb_m2s_cpu_d_qspi_flash_mem_cti, wb_m2s_dbg_qspi_flash_mem_cti}),
    .wbm_bte_i ({wb_m2s_cpu_i_qspi_flash_mem_bte, wb_m2s_cpu_d_qspi_flash_mem_bte, wb_m2s_dbg_qspi_flash_mem_bte}),
    .wbm_dat_o ({wb_s2m_cpu_i_qspi_flash_mem_dat, wb_s2m_cpu_d_qspi_flash_mem_dat, wb_s2m_dbg_qspi_flash_mem_dat}),
    .wbm_ack_o ({wb_s2m_cpu_i_qspi_flash_mem_ack, wb_s2m_cpu_d_qspi_flash_mem_ack, wb_s2m_dbg_qspi_flash_mem_ack}),
    .wbm_err_o ({wb_s2m_cpu_i_qspi_flash_mem_err, wb_s2m_cpu_d_qspi_flash_mem_err, wb_s2m_dbg_qspi_flash_mem_err}),
    .wbm_rty_o ({wb_s2m_cpu_i_qspi_flash_mem_rty, wb_s2m_cpu_d_qspi_flash_mem_rty, wb_s2m_dbg_qspi_flash_mem_rty}),
    .wbs_adr_o (wb_qspi_flash_mem_adr_o),
    .wbs_dat_o (wb_qspi_flash_mem_dat_o),
    .wbs_sel_o (wb_qspi_flash_mem_sel_o),
    .wbs_we_o  (wb_qspi_flash_mem_we_o),
    .wbs_cyc_o (wb_qspi_flash_mem_cyc_o),
    .wbs_stb_o (wb_qspi_flash_mem_stb_o),
    .wbs_cti_o (wb_qspi_flash_mem_cti_o),
    .wbs_bte_o (wb_qspi_flash_mem_bte_o),
    .wbs_dat_i (wb_qspi_flash_mem_dat_i),
    .wbs_ack_i (wb_qspi_flash_mem_ack_i),
    .wbs_err_i (wb_qspi_flash_mem_err_i),
    .wbs_rty_i (wb_qspi_flash_mem_rty_i));

wb_arbiter
  #(.num_masters (3))
 wb_arbiter_oc_mem
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i ({wb_m2s_cpu_i_oc_mem_adr, wb_m2s_cpu_d_oc_mem_adr, wb_m2s_dbg_oc_mem_adr}),
    .wbm_dat_i ({wb_m2s_cpu_i_oc_mem_dat, wb_m2s_cpu_d_oc_mem_dat, wb_m2s_dbg_oc_mem_dat}),
    .wbm_sel_i ({wb_m2s_cpu_i_oc_mem_sel, wb_m2s_cpu_d_oc_mem_sel, wb_m2s_dbg_oc_mem_sel}),
    .wbm_we_i  ({wb_m2s_cpu_i_oc_mem_we, wb_m2s_cpu_d_oc_mem_we, wb_m2s_dbg_oc_mem_we}),
    .wbm_cyc_i ({wb_m2s_cpu_i_oc_mem_cyc, wb_m2s_cpu_d_oc_mem_cyc, wb_m2s_dbg_oc_mem_cyc}),
    .wbm_stb_i ({wb_m2s_cpu_i_oc_mem_stb, wb_m2s_cpu_d_oc_mem_stb, wb_m2s_dbg_oc_mem_stb}),
    .wbm_cti_i ({wb_m2s_cpu_i_oc_mem_cti, wb_m2s_cpu_d_oc_mem_cti, wb_m2s_dbg_oc_mem_cti}),
    .wbm_bte_i ({wb_m2s_cpu_i_oc_mem_bte, wb_m2s_cpu_d_oc_mem_bte, wb_m2s_dbg_oc_mem_bte}),
    .wbm_dat_o ({wb_s2m_cpu_i_oc_mem_dat, wb_s2m_cpu_d_oc_mem_dat, wb_s2m_dbg_oc_mem_dat}),
    .wbm_ack_o ({wb_s2m_cpu_i_oc_mem_ack, wb_s2m_cpu_d_oc_mem_ack, wb_s2m_dbg_oc_mem_ack}),
    .wbm_err_o ({wb_s2m_cpu_i_oc_mem_err, wb_s2m_cpu_d_oc_mem_err, wb_s2m_dbg_oc_mem_err}),
    .wbm_rty_o ({wb_s2m_cpu_i_oc_mem_rty, wb_s2m_cpu_d_oc_mem_rty, wb_s2m_dbg_oc_mem_rty}),
    .wbs_adr_o (wb_oc_mem_adr_o),
    .wbs_dat_o (wb_oc_mem_dat_o),
    .wbs_sel_o (wb_oc_mem_sel_o),
    .wbs_we_o  (wb_oc_mem_we_o),
    .wbs_cyc_o (wb_oc_mem_cyc_o),
    .wbs_stb_o (wb_oc_mem_stb_o),
    .wbs_cti_o (wb_oc_mem_cti_o),
    .wbs_bte_o (wb_oc_mem_bte_o),
    .wbs_dat_i (wb_oc_mem_dat_i),
    .wbs_ack_i (wb_oc_mem_ack_i),
    .wbs_err_i (wb_oc_mem_err_i),
    .wbs_rty_i (wb_oc_mem_rty_i));

endmodule
