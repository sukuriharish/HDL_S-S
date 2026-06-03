module pulse_generator (
    input  wire clk,      // System Clock
    input  wire rst_n,    // Asynchronous Reset (Active Low)
    input  wire trigger,  // Input signal to detect
    output wire pulse     // One-clock-cycle wide pulse
);

    reg trigger_delayed;

    // Sequential logic to delay the input by one clock cycle
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            trigger_delayed <= 1'b0;
        end else begin
            trigger_delayed <= trigger;
        end
    end

    // Combinational logic to detect the rising edge
    // Pulse is high only when current trigger is high AND previous was low
    assign pulse = trigger & (~trigger_delayed);

endmodule