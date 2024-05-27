module artificial_neural_network(
    input [31:0] in1, in2, in3,
    output [31:0] out1, out2
);

// Declare intermediate signals
wire [31:0] hidden_layer_outputs[4:0];

// Instantiate layers
layer hidden_layer(in1, in2, in3, hidden_layer_outputs[0], hidden_layer_outputs[1], hidden_layer_outputs[2], hidden_layer_outputs[3], hidden_layer_outputs[4]);
layer output_layer(hidden_layer_outputs[0], hidden_layer_outputs[1], hidden_layer_outputs[2], hidden_layer_outputs[3], hidden_layer_outputs[4], out1, out2);

endmodule
