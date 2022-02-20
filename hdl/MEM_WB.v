/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define DW  32
`define IW  32
`timescale 1ps/1ps
module MEM_WB (
	input wire 			clk,	
	input wire [`DW-1:0] 	in_data,		
	input wire [`IW-1:0] in_inst,
	output reg [`DW-1:0] 	out_data,
	output reg [`IW-1:0] out_inst
);

	always @(posedge clk) begin
		out_data <= #7 in_data;
		out_inst <= #7 in_inst;
	end


endmodule