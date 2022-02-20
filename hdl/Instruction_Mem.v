/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define IMW 4
`define IW  32
module Instruction_Mem 
  (input  wire [`IMW-1:0] 	address,
	input	 wire					im_cs,
	output reg  [`IW-1:0]	im_out
	);
	// r1 r2 wr rfe x
	//reg [7:0] ram[3:0];
	
	always @(*) begin
		if (!im_cs)
			im_out = 32'h00;
		else begin
			case (address)
				0 			: im_out = 32'h000046B3;
				1 			: im_out = 32'h00004633;
				2 			: im_out = 32'h000045B3;
				3 			: im_out = 32'h01458593;
				4 			: im_out = 32'h06558613;
				5 			: im_out = 32'h40B606B3;
				6 			: im_out = 32'h00D60733;
				7 			: im_out = 32'h00361793;
				8 			: im_out = 32'h00F00033;
				9 			: im_out = 32'h00000013;
				10 		: im_out = 32'h00000013;
				11			: im_out = 32'h00000013;
				12			: im_out = 32'h00000013;
				13			: im_out = 32'h00000013;
				14			: im_out = 32'h00000013;
				15			: im_out = 32'h00000013;
				default 	: im_out = 32'hXX;
			endcase
		end
	end
	
endmodule