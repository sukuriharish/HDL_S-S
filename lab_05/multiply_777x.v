`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 11:10:19 PM
// Design Name: 
// Module Name: multiply_777x
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


module multiply_777x(x,y);
parameter N=8;
input [N-1:0]x;
output [N+8:0]y;
assign y={x,9'b000000000}+{x,8'b00000000}+{x,3'b000}+x;
endmodule
