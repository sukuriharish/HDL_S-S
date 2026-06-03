module control (
    output reg [7:0] a,
    output reg [7:0] b,
    output reg [2:0] sel,
    output reg       sign,
    input            in,
    input            clk,     // Clock is required for cycle-by-cycle logic
    input            rst_n    // Active-low reset
);

    // We need a counter to keep track of which clock cycle we are on (0 to 19).
    // A 5-bit register can hold numbers up to 31.
    reg [4:0] counter; 

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset everything to 0
            a       <= 8'b0;
            b       <= 8'b0;
            sel     <= 3'b0;
            sign    <= 1'b0;
            counter <= 5'd0;
        end else begin
            // 1. Route the input to the correct variable based on the current cycle
            if (counter < 5'd8) begin
                // Cycles 0 to 7: Assign to a[0] through a[7]
                a[counter] <= in;
            end 
            else if (counter < 5'd16) begin
                // Cycles 8 to 15: Assign to b[0] through b[7]
                // We subtract 8 from the counter to get the index 0 to 7 for 'b'
                b[counter - 5'd8] <= in;
            end 
            else if (counter < 5'd19) begin
                // Cycles 16 to 18: Assign to sel[0] through sel[2]
                sel[counter - 5'd16] <= in;
            end 
            else if (counter == 5'd19) begin
                // Cycle 19: Assign to sign
                sign <= in;
            end

            // 2. Increment the cycle counter
            if (counter == 5'd19) begin
                // Once we hit the 20th cycle (index 19), start over
                counter <= 5'd0;
            end else begin
                // Otherwise, move to the next cycle
                counter <= counter + 1'b1;
            end
        end
    end

endmodule
