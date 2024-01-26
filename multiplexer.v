module multiplexer(
	input [7:0] mult, addsub,
	input op_sel, //1'b0 = add, subtract, 1'b1 = multiply
	output reg [7:0] mux_out
);

	mux_out = op_sel ? mult : addsub;
	
endmodule
