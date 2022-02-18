module Instruction_Mem 
  (input  wire [1:0] 	address,
	input	 wire				im_cs,
	output reg  [7:0]		data
	);
	// r1 r2 wr rfe x
	//reg [7:0] ram[3:0];
	
	always @(*) begin
		if (!im_cs)
			data = 8'h00;
		else begin
			case (address)
				0 			: data = 8'b00_10_01_00;
				1 			: data = 8'b10_00_01_00;
				2 			: data = 8'b01_10_00_00;
				3 			: data = 8'b10_11_00_00;
				default 	: data = 8'hXX;
			endcase
		end
	end
	
endmodule