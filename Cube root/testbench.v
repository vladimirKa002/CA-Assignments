module testbench;

reg [0:7] in1;
wire  out;
wire  out2;
wire  out3;
wire  out4;

cube_root cr(in1, out, out2, out3, out4);

//limit - [0 ; 256]

initial
begin
in1 = 7'd255;
#5
in1 = 7'd90;
#5;
in1 = 7'd3;
#5;
in1 = 7'd6;
#5;
in1 = 7'd15;
#5;
in1 = 7'd27;
#5
in1 = 7'd8;
#5
in1 = 7'd2;
#5;
in1 = 7'd1;
#5;
in1 = 7'd0;
end

initial
$monitor("in1 = %6d out = %6d out2 = %6d out3 = %6d out4 = %6d", in1, out, out2, out3, out4);

initial
$dumpvars;

endmodule