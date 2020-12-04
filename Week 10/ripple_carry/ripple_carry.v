module ripple_carry(
  input[15:0] in1, in2,
  output[15:0] out,
  output overflow
);

wire[15:0] carry_bit;

half_adder ha (
	.x (in1[0]),
	.y (in2[0]),
	.carry (carry_bit[0]),
	.result (out[0])
);

generate
	genvar i;
	for (i = 1; i <= 14; i = i +1)
	begin : block_name
		full_adder fa (
			.x (in1[i]),
			.y (in2[i]),
			.carry_in (carry_bit[i-1]),
			.result (out[i]),
			.carry_out (carry_bit[i])
		);
	end
endgenerate
full_adder fa (
		.x (in1[15]),
		.y (in2[15]),
		.carry_in (carry_bit[14]),
		.result (out[15]),
		.carry_out (overflow)
);


endmodule 