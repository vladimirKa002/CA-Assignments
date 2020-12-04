module alu_decoder(
  input [5:0] funct,
  input [1:0] ALUOp,
  output reg[2:0] ALUControl

);

always@(*)
begin
  case(ALUOp[1])
  1'b1: begin // 1X case
    case(funct)
      6'h20:begin
        ALUControl = 3'b010;
      end
      6'h22:begin
        ALUControl = 3'b110;
      end
      6'h24:begin
        ALUControl= 3'b000;
      end
      6'h25:begin
        ALUControl= 3'b001;
      end
      6'h2A:begin
        ALUControl =3'b111;
      end
    endcase
  end
  1'b0: begin
    if(ALUOp[0])begin // 01
      ALUControl = 3'b110;
    end
    else begin  //00
      ALUControl= 3'b010;
    end

  end
  endcase

end



endmodule