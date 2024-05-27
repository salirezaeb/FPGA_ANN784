module artificial_neural_network(
    input [31:0] bias,
    output [31:0] out1, out2,out3,out4,out5
);

// Declare intermediate signals
wire [31:0] hidden_layer_outputs[4:0];
assign out1 = hidden_layer_outputs[0];
assign out2 = hidden_layer_outputs[1];
assign out3 = hidden_layer_outputs[2];
assign out4 = hidden_layer_outputs[3];
assign out5 = hidden_layer_outputs[4];
// Instantiate layers
layer hidden_layer( bias, hidden_layer_outputs[0], hidden_layer_outputs[1], hidden_layer_outputs[2], hidden_layer_outputs[3], hidden_layer_outputs[4]);
//layer output_layer(hidden_layer_outputs[0], hidden_layer_outputs[1], hidden_layer_outputs[2], hidden_layer_outputs[3], hidden_layer_outputs[4], out1, out2);

endmodule

