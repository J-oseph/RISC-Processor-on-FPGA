/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define DW  32
`define IW  32
`timescale 1ps/1ps
module EXE_MEM (
	input wire 				clk,	
	input wire [`DW-1:0] in,		
	input wire [`IW-1:0] in_inst,
	output reg [`DW-1:0] out,
	output reg [`IW-1:0] out_inst
);

	always @(posedge clk) begin
		out 		<= #6 in;
		out_inst <= #6 in_inst;
	end


endmodule