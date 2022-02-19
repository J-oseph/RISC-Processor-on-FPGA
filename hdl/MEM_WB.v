`timescale 1ps/1ps
module MEM_WB (
	input wire 			clk,	
	input wire [7:0] 	in_data,		
	input wire [31:0] in_inst,
	output reg [7:0] 	out_data,
	output reg [31:0] out_inst
);

	always @(posedge clk) begin
		out_data <= #7 in_data;
		out_inst <= #7 in_inst;
	end


endmodule