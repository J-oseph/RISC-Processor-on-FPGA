/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define DW  32
`define IW  32
`timescale 1ps/1ps
module ID_EXE(
	input wire 				clk,	
	input wire [`DW-1:0] 		in_r1,	
	input wire [`DW-1:0] 		in_r2,
	input wire [`IW-1:0] 	in_inst,		
	output reg [`DW-1:0] 		out_r1,	
	output reg [`DW-1:0] 		out_r2,
	output reg [`IW-1:0] 	out_inst
	
);

	always @(posedge clk) begin
		out_r1 	<= #5 in_r1;
		out_r2 	<= #5 in_r2;
		out_inst <= #5 in_inst;
	end

endmodule