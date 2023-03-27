
module ID_EXE
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire clk,
	input wire [IW-1:0] in_inst,
	input wire [DW-1:0] r1,
	input wire [DW-1:0] r2,
	input wire [RFW-1:0] rd,
	output reg [DW-1:0] r1_o,
	output reg [DW-1:0] r2_o,
	output reg [RFW-1:0] rd_o,
	output reg [IW-1:0] out_inst);

	always @(posedge clk) begin
		out_inst <= #1 in_inst;
		r1_o <= #1 r1;
		r2_o <= #1 r2;
		rd_o <= #1 rd;
	end


endmodule