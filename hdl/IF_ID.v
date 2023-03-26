
module IF_ID
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire clk,
	input wire [IW-1:0] in,
	output reg [IW-1:0] out);

	always @(posedge clk) begin
		out <= #1 in;
	end


endmodule