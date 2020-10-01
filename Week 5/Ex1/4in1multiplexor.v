module 4in1multiplexor (
	input [1:0] selector ,
	input [3:0] input_pins,
	output reg output_pin 
	
);
always @(*)
	case (sel)
		2'b00:
			begin
			output_pin = input_pins[0];
			end
		2'b01:
			begin
			output_pin = input_pins[1];
			end
		2'b10:
			begin
			output_pin = input_pins[2];
			end
		2'b11:
			begin
			output_pin = input_pins[3];
			end
	endcase
endmodule 