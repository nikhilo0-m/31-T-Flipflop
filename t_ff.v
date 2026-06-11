`timescale 1ns / 1ps

module t_ff(
    input clk,      // Clock input
    input rst,      // Active-high reset
    input t,        // Toggle input
    output reg q    // Output
);

    // Trigger on positive edge of clock or reset
    always @(posedge clk or posedge rst)
    begin
        if (rst)
            q <= 1'b0;       // Reset output
        else if (t)
            q <= ~q;         // Toggle output
        else
            q <= q;          // Hold state
    end

endmodule
