`timescale 1ns / 1ps
module adder(output c, output [31:0] out, input [31:0] a,b);
assign {c,out}=a+b;
endmodule
