
module RF
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(
	input wire 				clk,
	input wire 				we,	
	input wire 	[RFW-1:0]	reg1,
	input wire 	[RFW-1:0]	reg2,
	input wire 	[RFW-1:0]	wreg,
	input wire 	[DW-1:0]	wdata,
	output reg 	[DW-1:0] 	reg1data,
	output reg 	[DW-1:0] 	reg2data
);
	reg [DW-1:0] rf[2**RFW-1:0];
	integer i;
	
	always @(*) begin
		reg1data = rf[reg1];
		reg2data = rf[reg2];
		
		if (reg1 == 0)
			reg1data = 0;
		if (reg2 == 0)
			reg2data = 0;
	end
	

	always @(negedge clk) begin
		if (we) begin
			rf[wreg] <= #1 wdata;
		end
	end

	initial begin
		for (i=0;i<2**RFW;i=i+1) begin
			rf[i] <= 32'b1;
		end
	end

endmodule