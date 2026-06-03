`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 10:15:45 PM
// Design Name: 
// Module Name: multiply_6x
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

module multiply_2x(x,y2);
parameter N=8;
input [N-1:0]x;
output [N:0]y2;
assign y2={x,1'b0};
endmodule

module multiply_4x(x,y4);
parameter N=8;
input [N-1:0]x;
output [N+1:0]y4;
assign y4={x,2'b00};
endmodule

module multiply_6x(x,y6);
parameter N=8;
input [N-1:0]x;
output [N+1:0]y6;

wire [N:0]t1;
wire [N+1:0]t2;
multiply_2x A1(.x(x),.y2(t1));
multiply_4x A2(.x(x),.y4(t2));

assign y6=t1+t2;
endmodule




/*module multiply_6x(x,y);
parameter N=8;
input [N-1:0]x;
output [N+1:0]y;
assign y={x,2'b00}+{x,1'b0};
endmodule*/
