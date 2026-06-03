`timescale 1ns / 1ps

module uni_shift_reg_with_sync_reset (
    input clk,
    input rst_n_asyn,      // Raw asynchronous reset from button/pin
    input [1:0] mode,
    input s_input_right,
    input s_input_left,
    input [3:0] data_in,
    output [3:0] data_out
);

    // Internal signal for the synchronized reset
    wire rst_n_sync;

    // 1. Instantiate the Reset Synchronizer
    reset_synchronizer sync_inst (
        .clk(clk),
        .rst_n_asyn(rst_n_asyn),
        .rst_n_sync(rst_n_sync)
    );

    // 2. Instantiate the Universal Shift Register
    // Note: We pass the sync reset to the reset_n port
    universal_shift_register usr_inst (
        .clk(clk),
        .reset_n(rst_n_sync), 
        .mode(mode),
        .s_input_right(s_input_right),
        .s_input_left(s_input_left),
        .data_in(data_in),
        .data_out(data_out)
    );

endmodule