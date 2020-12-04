module full_adder(
  input x, y,
  input carry_in,
  output result,
  output carry_out
);

assign result = x ^ y ^ carry_in;
assign carry_out = x & y | (x^y) & carry_in;

endmodule 