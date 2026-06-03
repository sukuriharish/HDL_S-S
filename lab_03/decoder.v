`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 19:53:23
// Design Name: 
// Module Name: decoder
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


module decoder( input b, output d0,d1,d2,d3

    );
    wire a=1'b0;
    assign d0=~a&~b;
    assign d1=~a&b;
    assign d2=a&~b;
    assign d3=a&b;
endmodule
