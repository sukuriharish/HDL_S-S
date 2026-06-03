module dff(output reg q, input d,clk,rst,ce);
always @(posedge clk,negedge rst)
  begin 
  if(ce) begin
   if(!rst)
    begin
     q<=1'b0;
    end
   else begin 
    q<=d;
 end
 end
 end
 endmodule
