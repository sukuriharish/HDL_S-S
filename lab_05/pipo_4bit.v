`timescale 1ns / 1ps


module pipo_4bit(
input clk,reset_n,
input [3:0] data_in,
output reg [3:0] data_out
    );
    
    always @(posedge clk or negedge reset_n)
    if (!reset_n)
    data_out<=4'b0000;
    else 
    data_out<=data_in;
 
endmodule