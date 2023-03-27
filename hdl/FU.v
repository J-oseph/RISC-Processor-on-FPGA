`include "hdl/definitions.v"

module FU 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire 	[RFW-1:0] reg1,
	input wire 	[RFW-1:0] reg2,
    input wire  [DW-1:0] reg1data,
    input wire  [DW-1:0] reg2data,
    input wire  [DW-1:0] exedata,
    input wire  [DW-1:0] memdata,
    input wire  [IW-1:0] meminst,
    input wire  [IW-1:0] exeinst,
    output reg  [DW-1:0] reg1data_out,
    output reg  [DW-1:0] reg2data_out);

	wire [RFW-1:0] rd_exe, rd_mem;
	wire [6:0] opcode_alu, opcode_mem;
	
	assign opcode_alu = exeinst[6:2];
	assign opcode_mem = meminst[6:2];
	assign rd_exe		= exeinst[11:7 ];
	assign rd_mem		= meminst[11:7 ];

    always @(*) begin
        reg1data_out = reg1data;
        reg2data_out = reg2data;
		// $display(opcode_mem);
		// $display("P = %b",opcode_mem);
		
		if (opcode_mem == `OP | opcode_mem == `OP_IMM) begin
			// forwarding from the MEM stage
			if (reg1 == rd_mem)
				reg1data_out = memdata;
			if (reg2 == rd_mem)
				reg2data_out = memdata;
		end
		
		if (opcode_alu == `OP | opcode_alu ==`OP_IMM) begin
			// forwarding from the EXE stage
			// higher priority than MEM, because data is newer
			if (reg1 == rd_exe)
				reg1data_out = exedata;
			if (reg2 == rd_exe)
				reg2data_out = exedata;
		end
		
		if (reg1 == 0)
			reg1data_out = 0;
		if (reg2 == 0)
			reg2data_out = 0;
    end

endmodule
