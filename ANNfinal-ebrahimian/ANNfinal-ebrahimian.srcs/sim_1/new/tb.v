`timescale 1ns / 1ps

module artificial_neural_network_tb;

reg [31:0] in1, in2, in3;
wire [31:0] out1, out2;
reg clk, rst;

// Instance of the artificial neural network
artificial_neural_network ann(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out1(out1),
    .out2(out2)
);

// Clock process definitions
always #5 clk = ~clk; // Clock period of 10 ns

initial begin
    // Initialize the signals
    clk = 0;
    rst = 1;
    in1 = 0;
    in2 = 0;
    in3 = 0;

    // Reset activation
    #20;  // Wait for 20 ns
    rst = 0;

    // Test case 1
    in1 = 32'd2;  // Input 1
    in2 = 32'd3;  // Input 2
    in3 = 32'd4;  // Input 3
    #100; // Wait for 100 ns to observe the output

    // Test case 2
    in1 = 32'd5;  // Input 4
    in2 = 32'd6;  // Input 5
    in3 = 32'd7;  // Input 6
    #100; // Wait for 100 ns to observe the output

    // Finish simulation
    $finish;
end

endmodule
