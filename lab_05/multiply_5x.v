`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 10:57:52 PM
// Design Name: 
// Module Name: multiply_5x
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


module multiply_5x(x,y);
parameter N=3;
input [N-1:0]x;
output [N+1:0]y;
assign y={x,2'b00}+x;
endmodule
