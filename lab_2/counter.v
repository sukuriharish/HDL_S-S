`timescale 1ns / 1ps


module counter4(
input clk,rst,
output reg out
    );
    reg [26:0] count;
    
    always @ (posedge clk )
    begin
    if(rst)
    count<=27'b0000;
    else
    count<=count+1;
    out = count[27];
    end
    
    
endmodule