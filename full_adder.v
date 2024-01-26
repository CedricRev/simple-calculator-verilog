module full_adder(input wire a, b, cin, output wire c, cout);
  
  wire wxor1, wand1, wand2;
  xor xor1(wxor1, a, b);
  xor xor2(c, wxor1, cin);
  and and1(wand1, a, b);
  and and2(wand2, wxor1, cin);
  or or1(cout, wand2, wand1);
	
endmodule
