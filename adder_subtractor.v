module adder_subtractor(
  input [3:0] a, b,
  input mode, // 0 = add, 1 = subtract
  output [3:0] sum,
  output cout, overflow
  );
	
  wire wxor0, wxor1, wxor2, wxor3;
  wire [2:0] faCout;
	
  xor xor0(wxor0, mode, b[0]);
  xor xor1(wxor1, mode, b[1]);
  xor xor2(wxor2, mode, b[2]);
  xor xor3(wxor3, mode, b[3]);
	
  full_adder fa_0(a[0], wxor0, mode, sum[0], faCout[0]);
  full_adder fa_1(a[1], wxor1, faCout[0], sum[1], faCout[1]);
  full_adder fa_2(a[2], wxor2, faCout[1], sum[2], faCout[2]);
  full_adder fa_3(a[3], wxor3, faCout[2], sum[3], cout);
	
  xor xor4(overflow, cout, faCout[2]);
	
endmodule
