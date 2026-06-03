`timescale 1ns / 1ps

// --- 2. Enhanced Universal Shift Register (Parametrized) ---
module universal_shift_register_enhanced #(
    parameter WIDTH = 8
)(
    input clk,
    input rst_n,        // Synchronized reset comes here
    input start_trans,
    input [1:0] mode,
    input s_input_right,
    input s_input_left,
    input [WIDTH-1:0] data_in,
    input input_parity,
    output reg [WIDTH-1:0] data_out,
    output reg trans_finish,
    output reg parity_error,
    output parity_bit
);
    reg [$clog2(WIDTH):0] count; // Automatic counter size based on WIDTH
    assign parity_bit = ^data_out; // Current data ki parity

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_out <= 0;
            trans_finish <= 0;
            parity_error <= 0;
            count <= 0;
        end else if (start_trans) begin
            case (mode)
                2'b00 : data_out <= data_out; // Hold
                2'b01 : data_out <= {s_input_right, data_out[WIDTH-1:1]}; // Right
                2'b10 : data_out <= {data_out[WIDTH-2:0], s_input_left};  // Left
                2'b11 : begin 
                    data_out <= data_in; // Parallel Load
                    parity_error <= (input_parity != ^data_in);
                end
            endcase

            // Transaction Finish Logic
            if (mode == 2'b11) begin
                trans_finish <= 1;
            end else if (mode == 2'b01 || mode == 2'b10) begin
                if (count == WIDTH-1) begin
                    trans_finish <= 1;
                    count <= 0;
                end else begin
                    count <= count + 1;
                    trans_finish <= 0;
                end
            end
        end else begin
            trans_finish <= 0;
            count <= 0;
        end
    end
endmodule

