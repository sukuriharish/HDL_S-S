module mux_32_1( output out, input [31:0] in, input [4:0]sel

    );
    assign out=in[sel];
endmodule
