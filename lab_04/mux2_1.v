`timescale 1ns / 1ps
module mux2_10( output y, input [1:0] x,
input s
   );
    assign y=x[s];
endmodule


module mux2_11( output y, input [1:0] x,
input s
   );
   assign y=~s&x[0]|s&x[1];
endmodule


module mux2_12( output reg y, input [1:0] x,
input s
    );
always @*
begin 
if(s)
 y=x[1]; 
else 
y=x[0];
end
endmodule


module mux2_13( output y, input [1:0] x,
input s
    );
    wire s_bar,t1,t2;
     not n1(s_bar,s);
     and a1(t1,s,x[0]);
     and a2(t2,s_bar,x[1]);
     or o1(y,t1,t2);       
endmodule 


module tb_t;
wire a,c,d,e;
reg [1:0]b;
reg sel;
mux2_10 dut(.y(a),.x(b),.s(sel));
mux2_11 duT(.y(c),.x(b),.s(sel));
mux2_12 duX(.y(d),.x(b),.s(sel));
mux2_13 duj(.y(e),.x(b),.s(sel));
initial  b=2'b01;
initial begin 
#10 b=2'b01;#5 sel=0;#10 sel=1;
#10 b=2'b11;#5 sel=0;#10 sel=1;


end

endmodule 