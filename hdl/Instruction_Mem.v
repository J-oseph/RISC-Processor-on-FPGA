module Instruction_Mem 
  (input  wire [1:0] 	address,
	input	 wire				im_cs,
	output reg  [31:0]	im_out
	);
	// r1 r2 wr rfe x
	//reg [7:0] ram[3:0];
	
	always @(*) begin
		if (!im_cs)
			im_out = 32'h00;
		else begin
			case (address)
				0 			: im_out = 32'h002000B3;
				1 			: im_out = 32'h000100B3;
				2 			: im_out = 32'h00308133;
				3 			: im_out = 32'h001101B3;
				default 	: im_out = 32'hXX;
			endcase
		end
	end
	
endmodule