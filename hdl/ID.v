`include "hdl/definitions.v"// definitions for all of the global variables

module ID 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire 	[IW-1:0] inst,
	output reg 	[RFW-1:0] addrA,
	output reg 	[RFW-1:0] addrB,
	output wire [RFW-1:0] rd,
	output reg 	[DW-1:0] imm);

	wire [RFW-1:0] rs2, rs1;
	wire [6:0] funct7;
	wire [6:0] opcode;
	wire [2:0] funct3;
	wire [DW-1:0] imm_I, imm_U, imm_S, imm_B, imm_J;

	assign imm_I	= { {20{inst[31]}}, inst[30:20] };
	assign imm_S	= { {20{inst[31]}}, inst[30:25],inst[11:7]};
	assign imm_B	= { {19{inst[31]}},inst[7],inst[30:25],inst[11:8], 1'b0};
	assign imm_U	= { {inst[31:12]}, {12{1'b0}} };
	assign imm_J	= { {11{inst[31]}}, inst[19:12],inst[20],inst[30:21], 1'b0};
	assign funct7 	= inst[31:25];
	assign rs2 		= inst[24:20];
	assign rs1		= inst[19:15];
	assign funct3	= inst[14:12];
	assign rd		= inst[11:7 ];
	assign opcode	= inst[6 :2 ];

	always @(*) begin
		if (inst[1:0] != 2'b11) begin
			$display("ERROR IN INSTRUCTION");
			$display(inst);
		end

		if 	  	(opcode == `OP) begin
			// R
			addrA = rs1;
			addrB = rs2;
			imm = 32'hX;
		end
		else if (opcode == `OP_IMM || opcode == `JALR || opcode == `LOAD || opcode == `SYSTEM) begin
			// I
			addrA = rs1;
			addrB = 32'hX;
			imm = imm_I;
		end
		else if (opcode == `STORE) begin
			// S
			addrA = rs1;
			addrB = rs2;
			imm = imm_S;
		end
		else if (opcode == `BRANCH) begin
			// B
			addrA = rs1;
			addrB = rs2;
			imm = imm_B;
		end
		else if (opcode == `LUI || opcode == `AUIPC) begin
			// U
			addrA = 32'hX;
			addrB = 32'hX;
			imm = imm_U;
		end
		else if (opcode == `JAL) begin
			// J
			addrA = 32'hX;
			addrB = 32'hX;
			imm = imm_J;
		end
	end

endmodule