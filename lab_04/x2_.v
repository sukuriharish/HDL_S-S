`timescale 1ns / 1ps
module x2_#(parameter N=8)(output [N:0] out, input [N-1:0]in);
assign out={in,1'b00};
endmodule 
