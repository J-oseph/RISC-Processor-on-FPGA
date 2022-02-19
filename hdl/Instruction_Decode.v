`define RFW 2
module Instruction_Decode (
	input  wire [31:0]		in_inst,
	output wire [`RFW-1:0]	reg1,
	output wire [`RFW-1:0]	reg2
);

	//R type:	funct7[6:0] rs2[4:0] rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 7+5+5+3+5+7
	//I type:	imm[11:0] 				rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 12 +5+3+5+7
	
	wire [4:0] rs2, rs1, rd;
	wire [6:0] funct7, opcode;
	wire [2:0] funct3;
	
	assign funct7 	= in_inst[31:25];
	assign rs2 		= in_inst[24:20];
	assign rs1		= in_inst[19:15];
	assign funct3	= in_inst[14:12];
	assign rd		= in_inst[11:7 ];
	assign opcode	= in_inst[6 :0 ];

	assign reg1 	= rs1[`RFW-1:0];
	assign reg2 	= rs2[`RFW-1:0];

endmodule