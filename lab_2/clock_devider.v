`timescale 1ns / 1ps

module clock_divider(
    input clk,
    input rst,
    output [3:0] out,
    output [7:0] out2
);
    reg [1:0] clk_div_reg;
    wire clk2,clk1;

    // Clock Division Logic: Divide by 4
    always @(posedge clk or posedge rst) begin
        if (rst) 
            clk_div_reg <= 2'b0;
        else 
            clk_div_reg <= clk_div_reg + 1;
    end

    // Use the MSB of the counter as the divided clock
    assign clk2 = clk_div_reg[1];
    assign clk1=clk;
    
    clock_de a (
        .out(out),
        .clk1(clk1),
        .rst(rst)
    );
   clock_de1 a1 (
        .out2(out2),
        .clk2(clk2),
        .rst(rst)
    );
endmodule

module clock_de(
    output reg [3:0] out,
    input clk1,
    input rst
);
    reg [3:0] counter_4;

    always @(posedge clk1) begin 
        if(rst) begin 
            counter_4 <= 0;
            out <= 0;
        end 
        else begin 
            counter_4 <= counter_4 + 1;
            out <= counter_4;
        end 
    end

   
endmodule

module clock_de1(
    output reg [7:0] out2,
    input clk2,
    input rst
);
    reg [7:0] counter_8;
 always @(posedge clk2) begin 
        if(rst) begin 
            counter_8 <= 0;
            out2 <= 0;
        end 
        else begin 
            counter_8 <= counter_8 + 1;
            out2 <= counter_8;
        end
        end 
endmodule  