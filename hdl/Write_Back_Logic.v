module Write_Back_Logic(	
	input wire [7:0] 		in_data,		
	input wire [31:0] 	in_inst,
	input wire 		 		rf_we_e,
	output reg 	 			rf_we,
	output reg [7:0] 		wdata,
	output reg [1:0] 		wreg
);

	always @(*) begin
		rf_we = 0;
		
		// put inst decode here
		
		if (rf_we_e)
			rf_we = 1;
	end


endmodule