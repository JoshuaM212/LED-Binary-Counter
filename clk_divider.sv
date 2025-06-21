`timescale 1ns / 1ps

// Clock Divider Module
// - This module divides the input clock freq. by a specified factor.
// - Used on Blackboard FPGA with a 100 MHz clock input.

module clk_divider
(
    input clk_in,             // Input clock signal
    input reset,              // Reset signal
    input [26:0] desired_clk, // Given desired clock rate (ex. 27'd1 for 1 Hz)  
    output reg clk_out        // Clock output signal based on divider
);
    // Clock counter to track clock cycles
    reg [31:0] clock_count; 
    
    // Divider (27 bits to support 100 MHz to 1 Hz)
    reg [26:0] divider = (27'd100000000)/(desired_clk*2); 

    // Check if counter met limit:
    // - If not, increment counter
    // - If yes, reset counter and toggle clock output register
    always_ff @ (posedge(clk_in))
    begin
        if (reset)
        begin
            clock_count <= 31'b0; // Reset the counter
            clk_out     <= 1'b0;  // Reset the output clock
        end
        else if (clock_count < divider)
            clock_count <= clock_count + 1;
        else
        begin
            clock_count <= 0;
            clk_out <= ~clk_out;
        end
    end
endmodule