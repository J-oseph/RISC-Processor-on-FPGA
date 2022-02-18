`timescale 1ps/1ps
module IF_ID (
	input wire 			clk,	
	input wire [7:0] 	in,	
	output reg [7:0] 	out
);

	always @(posedge clk) begin
		out <= #2 in;
	end

endmodule