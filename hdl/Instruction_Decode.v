module Instruction_Decode (
	input  wire [7:0]	instruction,
	output wire [1:0]	reg1,
	output wire [1:0]	reg2,
	output wire [1:0]	wreg,
	output wire [1:0]	type
	//output wire [7:0]	wdata
	//output wire 		rf_enable
);
	// 00 : add
	// r1 r2 wr type
	// r11 r10 r21 r20 w1 w0 rf_enable X

	assign reg1 		= instruction[7:6];
	assign reg2 		= instruction[5:4];
	assign wreg 		= instruction[3:2];
	assign type 		= instruction[1:0];
	//assign wdata 		= {instruction[0],instruction[1],instruction[2],instruction[3],instruction[4],instruction[5],instruction[6],instruction[7]};
	//assign rf_enable 	= instruction[1];

endmodule