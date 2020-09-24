module Ex2(
	input [1:0] KEY, //keys
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5
);

assign HEX0 = KEY[0] ? 8'b11111100 : 8'b00000000;
assign HEX1 = KEY[0] ? 8'b01100000 : 8'b00000000;
assign HEX2 = KEY[0] ? 8'b11111100 : 8'b00000000;
assign HEX3 = KEY[0] ? 8'b11110110 : 8'b00000000;
assign HEX4 = KEY[0] ? 8'b11111100 : 8'b00000000;
assign HEX5 = KEY[0] ? 8'b11011010 : 8'b00000000;

endmodule 