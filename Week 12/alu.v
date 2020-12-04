module alu (
   input[4:0] rs, rt, rd,
	input[5:0] funct,
   input[4:0] shamt
);

wire[31:0] out1;
wire[31:0] out2;
wire[31:0] out3;
	
add add (
	.rs (rs),
	.rt (rt),
	.out (out1)
);
sub sub (
	.rs (rs),
	.rt (rt),
	.out (out2)
);
srl srl (
	.rt (rt),
	.shamt (shamt),
	.out (out3)
);

mux mux (
	.res1(out1),
	.res2(out2),
	.res3(out3),
	.funct(funct),
	.rd (rd)
);

endmodule 