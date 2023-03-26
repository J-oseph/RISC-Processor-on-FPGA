
module PC
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire clk,
	input wire start,
	input wire [IMW-1:0] in,
	output reg [IMW-1:0] out_r);
	
	reg [IMW-1:0] out_c;

	always @(*) begin
		out_c = out_r + 1;
	end
	always @(posedge clk) begin
		$display("Program Counter = %b",out_r);
		out_r <= #1 out_c;
	end

	always @(posedge start) begin
		out_r <= 0;
	end

endmodule