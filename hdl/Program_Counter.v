`timescale 1ps/1ps
module Program_Counter (
	input  wire 		clk,
	input  wire [1:0] in,
	output reg  [1:0] out
);
	always @(posedge clk) begin
		out <= #1 in;
	end
	
endmodule