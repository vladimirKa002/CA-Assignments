module srl(
  input[4:0] rt,
  input[4:0] shamt,
  output[31:0] out
);

assign out = glob.r[rt]>>shamt;

endmodule 