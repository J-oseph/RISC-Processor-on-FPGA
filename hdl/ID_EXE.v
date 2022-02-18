`timescale 1ps/1ps
module ID_EXE(
	input wire 			clk,	
	input wire [7:0] 	in_r1,	
	input wire [7:0] 	in_r2,
	input wire [7:0] 	in_inst,		
	output reg [7:0] 	out_r1,	
	output reg [7:0] 	out_r2,
	output reg [7:0] 	out_inst
	
);

	always @(posedge clk) begin
		out_r1 	<= #5 in_r1;
		out_r2 	<= #5 in_r2;
		out_inst <= #5 in_inst;
	end

endmodule