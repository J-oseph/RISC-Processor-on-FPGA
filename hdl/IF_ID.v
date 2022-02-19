`timescale 1ps/1ps
module IF_ID (
	input wire 			clk,	
	input wire [31:0] in,	
	output reg [31:0] out
);

	always @(posedge clk) begin
		out <= #2 in;
	end

endmodule