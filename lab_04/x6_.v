`timescale 1ns / 1ps
module x6_#(parameter N=8)(output [N+1:0] out, input [N-1:0]in);
assign out={in,2'b00};
endmodule 
