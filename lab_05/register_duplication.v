`timescale 1ns / 1ps

module register_duplication( 
    output [9:0] out_o, 
    input [319:0] in, 
    input [4:0] sel, 
    input clk
);

// This attribute tells Vivado to duplicate this register if it drives 
// more than 5 loads, which helps with timing.
 reg [4:0] sel_in;

always @(posedge clk) begin
    sel_in <= sel; // Using non-blocking for sequential logic
end

// Mapping 32-bit slices of 'in' to each 32:1 mux
mux_32_1 a1 (out_o[0], in[31:0],    sel_in);
mux_32_1 a2 (out_o[1], in ,   sel_in);
mux_32_1 a3 (out_o[2], in[95:64],   sel_in);
mux_32_1 a4 (out_o[3], in[127:96],  sel_in);
mux_32_1 a5 (out_o[4], in[159:128], sel_in);
mux_32_1 a6 (out_o[5], in[191:160], sel_in);
mux_32_1 a7 (out_o[6], in[223:192], sel_in);
mux_32_1 a8 (out_o[7], in[255:224], sel_in); // Fixed: 255 (32 bits)
mux_32_1 a9 (out_o[8], in[287:256], sel_in); // Fixed: Added correct slice
mux_32_1 a10(out_o[9], in[319:288], sel_in); // Fixed: Added final slice

endmodule