 module alu#(parameter N=8)(output reg [N:0] out,input [2:0]sel,input [N-1:0]a,[N-1:0]b, input clk);

 always @(clk,sel)
 begin
    case(sel)
    3'b000: out=a+b;
    3'b001: out=a-b;
    3'b010: out=a*b;
    3'b011: out=a&b;
    3'b100: out=a|b;
    3'b101: out=a>>1;
    3'b110: out=a<<1;
    default: out=0;
    endcase
 end
 endmodule 
