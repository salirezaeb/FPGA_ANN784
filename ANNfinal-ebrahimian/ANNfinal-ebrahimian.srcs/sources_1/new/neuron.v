module neuron(
    input [31:0] input1, input2, input3,
    output reg [31:0] out
);

// Initialize weights and bias to some non-zero values
// These values are placeholders and should be replaced with actual trained weights
initial begin
    weight1 = 32'd1; // Example: Initialize to 1
    weight2 = 32'd1; // Example: Initialize to 1
    weight3 = 32'd1; // Example: Initialize to 1
    bias    = 32'd1; // Example: Initialize to 1
end

reg [31:0] weight1, weight2, weight3;
reg [31:0] bias;
reg signed [63:0] weighted_sum; // Use a wider bus to accommodate potential overflow

// Compute weighted sum and apply ReLU activation function
always @(input1, input2, input3, weight1, weight2, weight3, bias) begin
    // Calculate the weighted sum. Cast inputs to signed if necessary.
    weighted_sum = (weight1 * input1) + (weight2 * input2) + (weight3 * input3) + bias;
    
    // Apply ReLU activation function
    if (weighted_sum > 0) begin
        out = weighted_sum[31:0]; // Take lower 32 bits of the result
    end else begin
        out = 0;
    end
end

endmodule
