module mux(
	input [31:0] res1, res2, res3,
	input [5:0] funct,
	input [4:0] rd
);

always@ (*) begin
	case ( funct)
	100000 : begin
	glob.r[rd] = res1;
	end
	100010 : begin
	glob.r[rd] = res2;
	end
	default : begin
	glob.r[rd] = res3;
	end
	endcase
end 
endmodule 