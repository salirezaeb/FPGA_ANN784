`timescale 1ns / 1ps

module artificial_neural_network_tb;

reg [31:0] bias;
wire [31:0] out1, out2, out3, out4, out5;
reg clk;

// Instance of the artificial neural network
artificial_neural_network ann(
    .bias(bias),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5)
);

// Clock process definitions
always #5 clk = ~clk; // Clock period of 10 ns

initial begin
    // Initialize the signals
    clk = 0; // Assuming a clock is necessary for your layer
    bias = 0;

    // Wait for a few clock cycles before starting the test
    repeat (2) @(posedge clk);

    // Test case 1: Apply a bias value
    bias = 32'd19;  // Example bias value
    #100; // Wait for 100 ns to observe the output

    // Test case 2: Apply another bias value
    bias = 32'd30;  // Another example bias value
    #100; // Wait for 100 ns to observe the output

    // Additional test cases can be added here

    // Finish simulation
    $finish;
end

endmodule
