`timescale 1ns / 1ns
module stop_watch(output reg [5:0]count,
output reg [5:0]m,
output reg [4:0]h,
input clk, 
input enable,
input rst);

initial
begin
count=6'b0;
m=6'b0;
h=5'b0;
end
always @(posedge clk)
begin
if(rst)
begin
 m[5:0] =6'b0;
 h[4:0] =5'b0;
 count[5:0]=6'b0;
end
else 
begin
if(rst)count=6'b0;
else 
begin 
    if(count==6'b111011)
      begin
         count=6'b0;
         if(m==6'b111011)
          begin
            m=6'b0;
            if(h==5'b10111)
              begin
                h=5'b0;
             end
             else
                h=h+1;
             end
        else
           m=m+1;
        end
   else 
    begin 
      count=count+1;
    end
 end
end
end
endmodule

module tb_sw;
wire [5:0]count;
wire [5:0]m;
wire [4:0]h;
reg clk; 
reg enable;
reg rst;                                

stop_watch DUT(.count(count),.m(m),.h(h),.clk(clk),.enable(enable),.rst(rst));

initial clk=1'b0;

always
begin
     #1 clk=~clk;
end
always @(posedge h)
begin
    if(h==10111)
    begin
         $display("%b",h);
         $finish;
     end
end 
//#600000000000 $finish;
endmodule 