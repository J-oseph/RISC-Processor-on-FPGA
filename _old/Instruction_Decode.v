/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define RFW 5
`define IW  32
module Instruction_Decode (
	input  wire [`IW-1:0]		in_inst,
	output reg  [`RFW-1:0]	reg1,
	output reg  [`RFW-1:0]	reg2
);

	//R type:	funct7[6:0] rs2[4:0] rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 7+5+5+3+5+7
	//I type:	imm[11:0] 				rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 12 +5+3+5+7
	
	wire [4:0] rs2, rs1, rd;
	wire [6:0] funct7, opcode;
	wire [2:0] funct3;
	wire [11:0] imm;
	
	assign funct7 	= in_inst[31:25];
	assign rs2 		= in_inst[24:20];
	assign rs1		= in_inst[19:15];
	assign funct3	= in_inst[14:12];
	assign rd		= in_inst[11:7 ];
	assign opcode	= in_inst[6 :0 ];
	
	assign imm		= in_inst[31:20];
	
	always @(*) begin
		if (opcode == 7'h33 | opcode == 7'h3A) begin
			// R
			reg1 	= rs1[`RFW-1:0];
			reg2 	= rs2[`RFW-1:0];
		end
		else if (opcode == 7'h03 | opcode == 7'h0F | opcode == 7'h13 | opcode == 7'h1B) begin
			// I
			reg1 = rs1[`RFW-1:0];
			reg2 = rs1[`RFW-1:0]; // don't care, but will assign to the same reg
			
		end else begin
			reg1 = 32'bx;
			reg2 = 32'bx;
		end
	end

endmodule