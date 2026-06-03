module NameDisplay(
    input clk,                // Onboard system clock
    output reg [3:0] anode,   // Selects which digit is ON
    output reg [6:0] cathode  // Selects which segments are ON
);

    reg [1:0] screen_select;
    reg [15:0] refresh_counter;

    // A simple timer to switch between digits
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        screen_select <= refresh_counter[15:14]; // Use upper bits for timing
    end

    // Hardcoded logic to assign a letter to a position
    always @(*) begin
        case(screen_select)
            2'b00: begin
                anode = 4'b1110;   // Digit 1 ON
                cathode = 7'b0010010; // 'S'
            end
            2'b01: begin
                anode = 4'b1101;   // Digit 2 ON
                cathode = 7'b0001000; // 'A'
            end
            2'b10: begin
                anode = 4'b1011;   // Digit 3 ON
                cathode = 7'b0101111; // 'R'
            end
            2'b11: begin
                anode = 4'b0111;   // Digit 4 ON
                cathode = 7'b0000111; // 'T'
            end
        endcase
    end
endmodule