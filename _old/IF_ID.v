/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define IW  32
`timescale 1ps/1ps
module IF_ID (
	input wire 			clk,	
	input wire [`IW-1:0] in,	
	output reg [`IW-1:0] out
);

	always @(posedge clk) begin
		out <= #2 in;
	end

endmodule