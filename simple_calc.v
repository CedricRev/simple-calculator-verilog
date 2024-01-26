module simple_calc(

	input [3:0] a, b,
	input [1:0] op_sel, //2'b00 = add, 2'b01 = subtract, 2'b1X = multiply
	output [7:0] result,
	output cout,
	output overflow
	);
	
	wire [7:0] mult_out, addsub_out;
	wire [3:0] sum;
	wire mode, tempcout, tempoverflow;
	
	assign mode = op_sel[0];
	
	
	assign Cout = op_sel[1] ? 1'b0 : tempcout;
	assign Overflow = op_sel[1] ? 1'b0 : tempoverflow;
	
	
	multiplier mult(a, b, mult_out);
	adder_subtractor addsub(a, b, mode, sum, tempcout, tempoverflow);
	assign addsub_out = {3'b00, tempcout, sum};
	
	multiplexer mux1(mult_out, addsub_out, op_sel[1], result);
	
endmodule
