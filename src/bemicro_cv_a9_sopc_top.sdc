
# Clock variables for this script
set clock_in_50                         DDR3_CLK_50MHZ
set clock_in_24                         CLK_24MHZ
set clock_in_enet_rx                    ENET_RX_CLK
set clock_out_enet_tx                   ENET_GTX_CLK
set clock_out_enet_mdc                  ENET_MDC


# Oscillator inputs
create_clock -name $clock_in_50                         \
             -period   20.000ns                         \
             [get_ports $clock_in_50]
                 
create_clock -name $clock_in_24                         \
             -period   41.667ns                         \
             [get_ports $clock_in_24]


derive_pll_clocks

derive_clock_uncertainty

