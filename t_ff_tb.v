`timescale 1ns/1ps

module t_ff_tb;

    reg clk, rst, t;
    wire q;

    // Instantiate DUT
    t_ff uut (
        .clk(clk),
        .rst(rst),
        .t(t),
        .q(q)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial
    begin
        // Display signal values
        $monitor("Time=%0t clk=%b rst=%b t=%b q=%b",
                  $time, clk, rst, t, q);

        // Initialize inputs
        clk = 0;
        rst = 1;
        t = 0;

        // Apply reset
        #10 rst = 0;

        // Test cases
        t = 0; #20; // Hold
        t = 1; #20; // Toggle
        t = 1; #20; // Toggle again
        t = 0; #20; // Hold

        $finish;
    end

endmodule