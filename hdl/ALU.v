module ALU (
	input  wire [7:0] 	in_r1,	
	input  wire [7:0] 	in_r2,
	input  wire [7:0] 	in_inst,	
	output reg  [7:0] 	out
);

	always @(*) begin
		case ({in_inst[1], in_inst[0]})
			2'b00		:	out = in_r1 + in_r2;
			default 	:	out = 8'bXXXXXXXX;
		endcase
	end

endmodule