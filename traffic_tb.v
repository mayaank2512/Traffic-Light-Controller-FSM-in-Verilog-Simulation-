`timescale 1ns/1ps

module traffic_tb;

    reg clk, rst;
    wire [2:0] NS, EW;

    Traffic_Controller uut (.clk(clk), .rst(rst), .NS(NS), .EW(EW));

    initial begin
        $dumpfile("traffic_wave.vcd");
        $dumpvars(0, traffic_tb);
        clk = 0; rst = 1;
        #10 rst = 0;
        #200 $finish;
    end

    always #5 clk = ~clk; // clock with 10 ns period

endmodule
