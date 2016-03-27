
# (C) 2001-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 15.0 145 win32 2016.03.24.18:29:48

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="ddr3_sdram"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/15.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router/
mkdir -p ./libraries/s0_seq_debug_agent/
mkdir -p ./libraries/dmaster_master_agent/
mkdir -p ./libraries/s0_seq_debug_translator/
mkdir -p ./libraries/dmaster_master_translator/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/dll0/
mkdir -p ./libraries/oct0/
mkdir -p ./libraries/c0/
mkdir -p ./libraries/dmaster/
mkdir -p ./libraries/s0/
mkdir -p ./libraries/p0/
mkdir -p ./libraries/pll0/
mkdir -p ./libraries/ddr3_sdram/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cyclonev_ver/
mkdir -p ./libraries/cyclonev_hssi_ver/
mkdir -p ./libraries/cyclonev_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_AC_ROM.hex ./
  cp -f $QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_inst_ROM.hex ./
  cp -f $QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_sequencer_mem.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim_ver     
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                         -work cyclonev_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                    -work cyclonev_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"                -work cyclonev_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_avalon_st_adapter_error_adapter_0.sv"    -work error_adapter_0                  -cdslib ./cds_libs/error_adapter_0.cds.lib                 
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_avalon_st_adapter.v"                     -work avalon_st_adapter                -cdslib ./cds_libs/avalon_st_adapter.cds.lib               
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_handshake_clock_crosser.v"                           -work crosser                          -cdslib ./cds_libs/crosser.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_clock_crosser.v"                                     -work crosser                          -cdslib ./cds_libs/crosser.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_pipeline_base.v"                                     -work crosser                          -cdslib ./cds_libs/crosser.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_arbitrator.sv"                                          -work rsp_mux                          -cdslib ./cds_libs/rsp_mux.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_rsp_mux.sv"                              -work rsp_mux                          -cdslib ./cds_libs/rsp_mux.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_rsp_demux.sv"                            -work rsp_demux                        -cdslib ./cds_libs/rsp_demux.cds.lib                       
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_arbitrator.sv"                                          -work cmd_mux                          -cdslib ./cds_libs/cmd_mux.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_cmd_mux.sv"                              -work cmd_mux                          -cdslib ./cds_libs/cmd_mux.cds.lib                         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_cmd_demux_001.sv"                        -work cmd_demux_001                    -cdslib ./cds_libs/cmd_demux_001.cds.lib                   
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_cmd_demux.sv"                            -work cmd_demux                        -cdslib ./cds_libs/cmd_demux.cds.lib                       
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_router_002.sv"                           -work router_002                       -cdslib ./cds_libs/router_002.cds.lib                      
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1_router.sv"                               -work router                           -cdslib ./cds_libs/router.cds.lib                          
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_slave_agent.sv"                                         -work s0_seq_debug_agent               -cdslib ./cds_libs/s0_seq_debug_agent.cds.lib              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_burst_uncompressor.sv"                                  -work s0_seq_debug_agent               -cdslib ./cds_libs/s0_seq_debug_agent.cds.lib              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_master_agent.sv"                                        -work dmaster_master_agent             -cdslib ./cds_libs/dmaster_master_agent.cds.lib            
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_slave_translator.sv"                                    -work s0_seq_debug_translator          -cdslib ./cds_libs/s0_seq_debug_translator.cds.lib         
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_master_translator.sv"                                   -work dmaster_master_translator        -cdslib ./cds_libs/dmaster_master_translator.cds.lib       
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_dmaster_p2b_adapter.sv"                                    -work p2b_adapter                      -cdslib ./cds_libs/p2b_adapter.cds.lib                     
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_dmaster_b2p_adapter.sv"                                    -work b2p_adapter                      -cdslib ./cds_libs/b2p_adapter.cds.lib                     
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_packets_to_master.v"                                    -work transacto                        -cdslib ./cds_libs/transacto.cds.lib                       
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_packets_to_bytes.v"                                  -work p2b                              -cdslib ./cds_libs/p2b.cds.lib                             
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_bytes_to_packets.v"                                  -work b2p                              -cdslib ./cds_libs/b2p.cds.lib                             
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_sc_fifo.v"                                              -work fifo                             -cdslib ./cds_libs/fifo.cds.lib                            
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_dmaster_timing_adt.sv"                                     -work timing_adt                       -cdslib ./cds_libs/timing_adt.cds.lib                      
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_jtag_interface.v"                                    -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_jtag_dc_streaming.v"                                           -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_jtag_sld_node.v"                                               -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_jtag_streaming.v"                                              -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_clock_crosser.v"                                     -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_pipeline_base.v"                                     -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_idle_remover.v"                                      -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_idle_inserter.v"                                     -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_st_pipeline_stage.sv"                                   -work jtag_phy_embedded_in_jtag_master -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_reset_controller.v"                                            -work rst_controller                   -cdslib ./cds_libs/rst_controller.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_reset_synchronizer.v"                                          -work rst_controller                   -cdslib ./cds_libs/rst_controller.cds.lib                  
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_mm_interconnect_1.v"                                       -work mm_interconnect_1                -cdslib ./cds_libs/mm_interconnect_1.cds.lib               
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_dll_cyclonev.sv"                                        -work dll0                             -cdslib ./cds_libs/dll0.cds.lib                            
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_oct_cyclonev.sv"                                        -work oct0                             -cdslib ./cds_libs/oct0.cds.lib                            
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_hard_memory_controller_top_cyclonev.sv"                 -work c0                               -cdslib ./cds_libs/c0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_dmaster.v"                                                 -work dmaster                          -cdslib ./cds_libs/dmaster.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0.v"                                                      -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_avalon_mm_bridge.v"                                            -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_sequencer_cpu_cv_sim_cpu_inst.v"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_sequencer_cpu_cv_sim_cpu_inst_test_bench.v"             -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_sequencer_mem_no_ifdef_params.sv"                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_sequencer_rst.sv"                                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_mem_if_simple_avalon_mm_bridge.sv"                             -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_arbitrator.sv"                                          -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_burst_uncompressor.sv"                                  -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_master_agent.sv"                                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_reorder_memory.sv"                                      -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_slave_agent.sv"                                         -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altera_merlin_traffic_limiter.sv"                                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_irq_mapper.sv"                                          -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0.v"                                    -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_avalon_st_adapter.v"                  -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_demux.sv"                         -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_demux_001.sv"                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_demux_002.sv"                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_mux.sv"                           -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_mux_001.sv"                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_cmd_mux_003.sv"                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router.sv"                            -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router_001.sv"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router_002.sv"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router_003.sv"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router_004.sv"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_router_006.sv"                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_rsp_demux_001.sv"                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_rsp_demux_003.sv"                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_rsp_mux.sv"                           -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_rsp_mux_001.sv"                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_s0_mm_interconnect_0_rsp_mux_002.sv"                       -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/sequencer_reg_file.sv"                                                -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_acv_phase_decode.v"                                     -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_acv_wrapper.sv"                                         -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_mgr.sv"                                                 -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_reg_file.v"                                             -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_siii_phase_decode.v"                                    -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_siii_wrapper.sv"                                        -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_sv_phase_decode.v"                                      -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/sequencer_scc_sv_wrapper.sv"                                          -work s0                               -cdslib ./cds_libs/s0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_clock_pair_generator.v"                                 -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_acv_hard_addr_cmd_pads.v"                               -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_acv_hard_memphy.v"                                      -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_acv_ldc.v"                                              -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_acv_hard_io_pads.v"                                     -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_generic_ddio.v"                                         -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_reset.v"                                                -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_reset_sync.v"                                           -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_phy_csr.sv"                                             -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_iss_probe.v"                                            -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0.sv"                                                     -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_p0_altdqdqs.v"                                             -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/altdq_dqs2_acv_connect_to_hard_phy_cyclonev.sv"                       -work p0                               -cdslib ./cds_libs/p0.cds.lib                              
  ncvlog -sv "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_pll0.sv"                                                   -work pll0                             -cdslib ./cds_libs/pll0.cds.lib                            
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram/ddr3_sdram_0002.v"                                                    -work ddr3_sdram                       -cdslib ./cds_libs/ddr3_sdram.cds.lib                      
  ncvlog     "$QSYS_SIMDIR/ddr3_sdram.v"                                                                                                                                                                      
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
