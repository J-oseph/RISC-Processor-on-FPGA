`define RFW 2
`timescale 1ps/1ps
module Register_File(
	input wire 					clk,
	input wire 					rf_we,
	input wire 					rf_reset,
	input wire 	[`RFW-1:0]	reg1,
	input wire 	[`RFW-1:0]	reg2,
	input wire 	[`RFW-1:0]	wreg,
	input wire 	[7:0]			wdata,
	output wire [7:0] 		reg1data,
	output wire [7:0] 		reg2data
);
	integer i;
	reg [7:0] rf[2**`RFW-1:0];
	
	assign reg1data = rf[reg1];
	assign reg2data = rf[reg2];

	always @(negedge clk) begin
		if (rf_reset) begin
			for (i=0;i<2**`RFW;i=i+1) begin
				rf[i] <= #3 i;
			end
		end
		else
			if (rf_we)
				rf[wreg] <= #3 wdata;
	end

endmodule