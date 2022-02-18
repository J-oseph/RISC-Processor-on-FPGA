`timescale 1ps/1ps
module MEM_WB (
	input wire 			clk,	
	input wire [7:0] 	in_data,		
	input wire [7:0] 	in_inst,
	output reg [7:0] 	out_data,
	output reg [7:0] 	out_addr
);
	reg out;
	always @(*) begin
		
	end

	always @(posedge clk) begin
		out_data <= #7 in_data;
		out_addr <= #7 out;
	end


endmodule