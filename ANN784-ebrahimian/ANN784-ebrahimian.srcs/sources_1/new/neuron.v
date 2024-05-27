module neuron(
    input [31:0] bias,            // Bias for the neuron
    output reg [31:0] out         // Output of the neuron
);
    reg [63:0] sum = 0;
    reg [31:0] weights [783:0];
    reg [31:0] inputs [783:0];
    integer i;

    // Initialize weights and inputs for testing
    initial begin
        for (i = 0; i < 784; i = i + 1) begin
            weights[i] = 32'd1; // Example: set each weight to 1
            inputs[i] = 32'd1;  // Example: set each input to 1
        end
    end

    // Compute weighted sum and apply ReLU activation function
    always @(*) begin
        sum = 0; // Reset sum for each calculation
        // Calculate the weighted sum
        for (i = 0; i < 784; i = i + 1) begin
            sum = sum + inputs[i] * weights[i];
        end
        sum = sum + bias; // Add the bias

        // Apply ReLU activation function
        if (sum > 0) begin
            out = sum[31:0]; // Assuming the sum fits in 32 bits
        end else begin
            out = 0;
        end
    end
endmodule
