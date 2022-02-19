`timescale 1ps/1ps
module EXE_MEM (
	input wire 				clk,	
	input wire [7:0] 		in,		
	input wire [31:0] 	in_inst,
	output reg [7:0] 		out,
	output reg [31:0] 	out_inst
);

	always @(posedge clk) begin
		out 		<= #6 in;
		out_inst <= #6 in_inst;
	end


endmodule