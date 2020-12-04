module half_adder(
	input x, y,
	output result,
	output carry
);

assign result = x ^ y;
assign carry = x & y;

endmodule 