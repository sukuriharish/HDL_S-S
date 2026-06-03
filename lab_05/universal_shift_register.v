`timescale 1ns / 1ps

module universal_shift_register(
input clk,
input reset_n,
input [1:0] mode,//mode for selection
input s_input_right,//serial input for right shift
input s_input_left,//serial input for left shift
input [3:0]data_in,//data_in for parallel load
output reg [3:0] data_out
    );
    always @ (posedge clk or negedge reset_n)
    begin
    if(!reset_n) begin
    data_out <= 4'b0000;
    end else begin
     case (mode)
           2'b00 : data_out <= data_out;//hold the value
           2'b01 : data_out <= {s_input_right,data_out[3:1]};//right shift 
           2'b10 : data_out <= {data_out[2:0],s_input_left};//left shift
           2'b11 : data_out <= data_in;//parallel load
           default : data_out <= data_out;
     endcase
     end
    end
endmodule
