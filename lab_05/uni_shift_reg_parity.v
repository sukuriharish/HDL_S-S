// --- 3. TOP MODULE (The Wrapper) ---
module uni_shift_reg_parity #(
    parameter DATA_WIDTH = 8 // Change to 4 or 8 here
)(
    input clk,
    input rst_n_asyn,
    input start_trans,
    input [1:0] mode,
    input s_right,
    input s_left,
    input [DATA_WIDTH-1:0] d_in,
    input p_in,
    output [DATA_WIDTH-1:0] d_out,
    output p_out,
    output p_err,
    output t_done
);

    wire sync_rst;

    // Instance of Reset Synchronizer
    reset_synchronizer sync_unit (
        .clk(clk),
        .rst_n_asyn(rst_n_asyn),
        .rst_n_sync(sync_rst)
    );

    // Instance of Enhanced Shift Register
    universal_shift_register_enhanced #(.WIDTH(DATA_WIDTH)) usr_unit (
        .clk(clk),
        .rst_n(sync_rst),
        .start_trans(start_trans),
        .mode(mode),
        .s_input_right(s_right),
        .s_input_left(s_left),
        .data_in(d_in),
        .input_parity(p_in),
        .data_out(d_out),
        .trans_finish(t_done),
        .parity_error(p_err),
        .parity_bit(p_out)
    );

endmodule