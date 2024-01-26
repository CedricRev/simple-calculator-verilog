module multiplier( 
  input [3:0] m, q,
  output [7:0] product);
	
  wire [3:0] mq_0; 
  wire [3:0] mq_1; 
  wire [3:0] mq_2; 
  wire [3:0] mq_3;

  // The pattern of multiplying is the same on how we multiply algebraically
  assign mq_0 = {m[3], m[2], m[1], m[0]} & {q[0], q[0], q[0], q[0]};
  assign mq_1 = {m[3], m[2], m[1], m[0]} & {q[1], q[1], q[1], q[1]};
  assign mq_2 = {m[3], m[2], m[1], m[0]} & {q[2], q[2], q[2], q[2]};
  assign mq_3 = {m[3], m[2], m[1], m[0]} & {q[3], q[3], q[3], q[3]};
	
  assign product [0] = mq_0[0];
  wire cout_0, cout_1, cout_2, cout_3, cout_4, cout_5, cout_6, cout_7, cout_8, cout_9, cout_10;
	
  wire ps_1, ps_2, ps_3, ps_4, ps_5, ps_6, ps_7, ps_8, ps_9;

  full_adder fa_0(mq_1[0], mq_0[1], 1'b0, product[1], cout_0);
	
  full_adder fa_1(mq_1[1], mq_0[2], cout_0, ps_1, cout_1); 
  full_adder fa_2(ps_1, mq_2[0], 1'b0, product[2], cout_2);
	
  full_adder fa_3(mq_0[3], mq_1[2], cout_1, ps_3, cout_3);
  full_adder fa_4(ps_3, mq_2[1], cout_2, ps_4, cout_4); 
  full_adder fa_5 (ps_4, mq_3[0], 1'b0, product[3], cout_5);
	
  full_adder fa_6(1'b0, mq_1[3], cout_3, ps_6, cout_6);
  full_adder fa_7(ps_6, mq_2[2], cout_4, ps_7, cout_7); 
  full_adder fa_8 (ps_7, mq_3[1], cout_5, product [4], cout_8); 
	
  full_adder fa_9(cout_6, mq_2[3], cout_7, ps_9, cout_9);  
  full_adder fa_10(ps_9, mq_3[2], cout_8, product [5], cout_10);
  full_adder fa_11 (cout_9, mq_3[3], cout_10, product [6], product [7]);

endmodule
