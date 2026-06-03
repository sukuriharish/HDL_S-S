`timescale 1ns / 1ps

module asic_fifo(
    output reg [15:0] read,
    output full,              
    output empty,              
    input [15:0] write,
    input clk1,              
    input clk2,               
    input write_en, 
    input read_en,
    input rst_n                
);

reg [15:0] fifo [15:0];
reg [4:0] write_counter, read_counter;
reg [4:0] write_pointer [1:0];
reg [4:0] read_pointer [1:0];
wire [4:0] write_gray;
wire [4:0] read_gray;

always @(posedge clk1 or negedge rst_n) begin
 if (!rst_n) begin
        write_counter <= 5'b0;
    end

     else if (write_en && !full) begin
        fifo[write_counter[3:0]] <= write;
        write_counter <= write_counter + 1;
    end
end

assign write_gray = write_counter ^ (write_counter >> 1);

always @(posedge clk2 or negedge rst_n) begin
if (!rst_n) begin
        read_counter <= 5'b0;
        read <= 16'b0;
    end 

 else if (read_en && !empty) begin
        read <= fifo[read_counter[3:0]];
        read_counter <= read_counter + 1;
    end
end


assign read_gray  = read_counter ^ (read_counter >> 1);


always @(posedge clk2 or negedge rst_n) begin
    if (!rst_n) begin
        write_pointer[0] <= 0;
         write_pointer[1] <= 0;
    end else begin
        write_pointer[0]  <= write_gray;
        write_pointer[1]  <= write_pointer[0] ;
    end
end

always @(posedge clk1 or negedge rst_n) begin
    if (!rst_n) begin
        read_pointer[0] <= 0;
        read_pointer[1] <= 0;
    end else begin
        read_pointer[0] <= read_gray;
        read_pointer[1] <= read_pointer[0];
    end
end


assign empty = (read_gray == write_pointer[1]);
assign full = (write_gray == {~read_pointer[1][4:3], read_pointer[1][2:0]});
endmodule