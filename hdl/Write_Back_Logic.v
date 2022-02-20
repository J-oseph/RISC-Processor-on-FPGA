/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define RFW 5
`define DW  32
`define IW  32
module Write_Back_Logic(	
	input wire [`DW-1:0] 	in_data,		
	input wire [`IW-1:0] 		in_inst,
	input wire 		 			rf_we_e,
	output reg 	 				rf_we,
	output reg [`DW-1:0] 	wdata,
	output reg [`RFW-1:0] 	wreg
);
	wire [4:0] rd;
	wire [6:0] opcode;
	
	assign rd		= in_inst[11:7 ];
	assign opcode	= in_inst[6 :0 ];

	always @(*) begin
		rf_we = 0;
		wdata = in_data;
		
		if (opcode == 7'h33 | opcode == 7'h13) begin
			//R or I
			rf_we = 1;
			wreg = rd[`RFW-1:0];
		end
		if (wreg == 0)
			rf_we = 0;
		
		if (!rf_we_e)
			rf_we = 0;
	end


endmodule