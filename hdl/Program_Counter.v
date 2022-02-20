/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`timescale 1ps/1ps
`define IMW 4
module Program_Counter (
	input  wire 		clk,
	input  wire [`IMW-1:0] in,
	output reg  [`IMW-1:0] out
);
	always @(posedge clk) begin
		out <= #1 in;
	end
	
endmodule