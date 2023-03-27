
module RF
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(
	input wire 				clk,
	input wire 				we,
	//input wire  [IW-1:0] 	alu_forward_inst,	
	//input wire  [IW-1:0] 	mem_forward_inst,	
	input wire 	[RFW-1:0]	reg1,
	input wire 	[RFW-1:0]	reg2,
	input wire 	[RFW-1:0]	wreg,
	input wire 	[DW-1:0]	wdata,
	//input wire 	[DW-1:0]	alu_rf_forward,
	//input wire 	[DW-1:0]	mem_rf_forward,
	output reg 	[DW-1:0] 	reg1data,
	output reg 	[DW-1:0] 	reg2data
);
	reg [DW-1:0] rf[2**RFW-1:0];
	integer i;
	
	//wire [4:0] rd_alu, rd_mem;
	//wire [6:0] opcode_alu, opcode_mem;
	
	//assign rd_alu		= alu_forward_inst[11:7 ];
	//assign opcode_alu	= alu_forward_inst[6 :0 ];
	//assign rd_mem		= mem_forward_inst[11:7 ];
	//assign opcode_mem	= mem_forward_inst[6 :0 ];
	
	always @(*) begin
		reg1data = rf[reg1];
		reg2data = rf[reg2];
		
		/*if (opcode_mem == 7'h33 | opcode_mem == 7'h13) begin
			// forwarding from the MEM stage
			if (rd_mem[RFW-1:0] == reg1[RFW-1:0])
				reg1data = mem_rf_forward;
			if (rd_mem[RFW-1:0] == reg2[RFW-1:0])
				reg2data = mem_rf_forward;
		end
		
		if (opcode_alu == 7'h33 | opcode_alu == 7'h13) begin
			// forwarding from the EXE stage
			// higher priority than MEM, because data is newer
			if (rd_alu[RFW-1:0] == reg1[RFW-1:0])
				reg1data = alu_rf_forward;
			if (rd_alu[RFW-1:0] == reg2[RFW-1:0])
				reg2data = alu_rf_forward;
		end*/
		
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
			rf[i] <= 32'b0;
		end
	end

endmodule