`timescale 1ns / 1ps

module pipo_with_sync_reset(
    input clk,
    input rst_n_asyn,    // Raw external reset
    input [3:0] data_in,
    output [3:0] data_out
    );

    wire rst_n_sync;

    // Instance 1: Reset Synchronizer
    reset_synchronizer sync_inst (
        .clk(clk),
        .rst_n_asyn(rst_n_asyn),
        .rst_n_sync(rst_n_sync)
    );

    // Instance 2: 4-bit PIPO Register
    pipo_4bit pipo_inst (
        .clk(clk),
        .reset_n(rst_n_sync), // Using the synchronized reset
        .data_in(data_in),
        .data_out(data_out)
    );

endmodule