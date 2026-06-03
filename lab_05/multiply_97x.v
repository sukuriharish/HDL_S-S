`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 11:05:01 PM
// Design Name: 
// Module Name: multiply_97x
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiply_97x(x,y);
parameter N=8;
input [N-1:0]x;
output [N+5:0]y;
assign y={x,6'b000000}+{x,5'b00000}+x;
endmodule
