
create_clock -name master_clk -period 10 [get_ports clk]
#create_generated_clock -name gen_clk_div4 \
#    -source  [get_ports clk]\
#    -divide_by 4 \ [get_nets clk2]
create_generated_clock -name gen_clk_div4 \
    -source [get_ports clk] \
    -divide_by 4 \
    [get_nets clk2]
set_clock_groups -asynchronous -group [get_clocks master_clk] -group [get_clocks gen_clk_div4]