`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2026 08:35:52
// Design Name: 
// Module Name: adder32
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


module adder32(
input [31:0]a,
input [31:0]b,
input add,
input enable,
output reg sum_out

    );
    
    wire [31:0]internal_sum;
    assign internal_sum=(add)?(a+b):32'b0;
    
    always@(*)begin
    if(enable)
    sum_out=internal_sum;
    else
    sum_out=32'b0;
    
    end
    
endmodule

module top_adder16(
input [511:0]a,
input [511:0]b,
input add,
input enable,
output wire [511:0]sum_out

);
genvar i;
generate
for(i=0;i<16;i=i+1)
begin:Adder_block
adder32 A1(.a(a[(i*32) +:32]),.b(b[(i*32) +:32]),.add(add),.enable(enable),.sum_out(sum_out[(i*32) +:32]));
end
endgenerate
endmodule


