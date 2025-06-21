`timescale 1ns / 1ps

// LED Counter Module
// - This module increments a counter every pos. edge of the divided clock
//   which connects to a LED register to visually see this change

module LED_counter
(
    input clk,                      // Input clock signal
    input reset,                    // Reset signal
    input divided_clk,              // Divided clock signal (from clk_divider)
    output reg [7:0] led_count      // LED count reg (to be connected to desired LEDs)
);
    reg prev_clk;

    // LED Counter State Machine
    // - On reset, zero led count and saved clk registers
    // - Else, led count register is incremented as long as its the first time the
    //   divided clock is counted 
    always_ff @ (posedge(clk))
    begin
        if (reset)
        begin
            led_count <= 8'b0;
            prev_clk <= 1'b0;
        end
        else
        begin
             if (divided_clk && divided_clk != prev_clk)
             begin
                led_count <= led_count + 1;
             end
             if (divided_clk != prev_clk)
                 prev_clk <= divided_clk;
        end
    end
endmodule