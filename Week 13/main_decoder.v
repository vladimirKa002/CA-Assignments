module main_decoder (
	input [5:0] opcode,
	output reg MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, 
	output reg [1:0] ALUOp
);

always@ (*) begin
	case (opcode)
	6'h00 : begin
		MemtoReg = 0;
		MemWrite = 0;
		Branch = 0;
		ALUSrc = 0;
		RegDst = 1;
		RegWrite = 1;
		ALUOp = 10;
	end
	6'h23 : begin
		MemtoReg = 1;
		MemWrite = 0;
		Branch = 0;
		ALUSrc = 1;
		RegDst = 0;
		RegWrite = 1;
		ALUOp = 00;
	end
	6'h2B : begin
		MemWrite = 1;
		Branch = 0;
		ALUSrc = 1;
		RegWrite = 0;
		ALUOp = 00;
	end
	6'h04 : begin
		MemWrite = 0;
		Branch = 1;
		ALUSrc = 0;
		RegWrite = 0;
		ALUOp = 01;
	end
	endcase
end 


endmodule 