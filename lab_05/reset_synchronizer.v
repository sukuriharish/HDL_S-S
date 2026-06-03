`timescale 1ns / 1ps


module reset_synchronizer(
input clk,
input rst_n_asyn,
output rst_n_sync
    );
     
     reg ff1,ff2;
      always @(posedge clk or negedge rst_n_asyn)
      begin
      if(!rst_n_asyn)
      begin
      ff1<=0;
      ff2<=0;
      end else begin
      ff1<=1;
      ff2<=ff1;
      end
      end
      
      assign rst_n_sync = ff2;
  
    endmodule
  
    /*reg [1:0] sync_ff;
    
    always @(posedge clk or negedge rst_n_asyn)
    begin
    if(!rst_n_asyn) 
    sync_ff <= 2'b00;
    else
    sync_ff <= {sync_ff[0],1'b1};
    end
    assign rst_n_sync = sync_ff[1];
endmodule */
