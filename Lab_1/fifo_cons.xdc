# Define the clocks
create_clock -period 3.226 [get_ports clk1]
create_clock -period 3.086 [get_ports clk2]

set_false_path -from [get_clocks clk1] -to [get_clocks clk2]
set_false_path -from [get_clocks clk2] -to [get_clocks clk1]

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk1]
set_property MAX_FANOUT 8 [get_nets -of_objects [get_ports *]]
