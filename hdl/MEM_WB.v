
module MEM_WB
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire clk,
	input wire [DW-1:0] in,		
	input wire [IW-1:0] in_inst,
	input wire [RFW-1:0] rd,
	output reg [DW-1:0] out,
	output reg [RFW-1:0] rd_o,
	output reg [IW-1:0] out_inst
);

	always @(posedge clk) begin
		out <= #1 in;
		out_inst <= #1 in_inst;
		rd_o <= #1 rd;
	end


endmodule