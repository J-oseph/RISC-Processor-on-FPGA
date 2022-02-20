/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/
`define DW  32
`define IW  32
module ALU (
	input  wire [`DW-1:0] in_r1,	
	input  wire [`DW-1:0] in_r2,
	input  wire [`IW-1:0] in_inst,	
	output reg  [`DW-1:0] out
);

	//R type:	funct7[6:0] rs2[4:0] rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 7+5+5+3+5+7
	//I type:	imm[11:0] 				rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 12 +5+3+5+7
	
	wire [6:0] 	funct7, opcode;
	wire [2:0] 	funct3;
	wire [9:0] 	R;
	wire [11:0] imm;
	wire [`DW-1:0] out_xor;
	
	assign funct7 	= in_inst[31:25];
	assign funct3	= in_inst[14:12];
	assign opcode	= in_inst[6 :0 ];
	assign imm		= in_inst[31:20];
	
	assign R = {funct3,funct7};
	assign I = funct3[2:0];
	
	//xor32 x0 (in_r1,in_r2,out_xor);
	

	always @(*) begin
		if (opcode == 7'h33) begin
			// R 
			// not included: sltu,sra,addw,subw,sllw,srlw,sraw,FP operations
			if 		(R == 10'h000)
				out = in_r1 + in_r2; 			// add
			else if 	(R == 10'h020)
				out = in_r1 - in_r2; 			// sub
			else if 	(R == 10'h100)
				out = in_r1 << in_r2; 			// sll
			else if 	(R == 10'h200)
				out = (in_r1 < in_r2) ? 1:0;	// slt
			else if 	(R == 10'h400)
				out = in_r1 + in_r2; 			// xor
			else if 	(R == 10'h500)
				out = in_r1 >> in_r2; 			// srl
			else if 	(R == 10'h600)
				out = in_r1 | in_r2; 			// or
			else if 	(R == 10'h700)
				out = in_r1 & in_r2; 			// and
			else
				out = 32'hxxxxxxxx;
		end else if (opcode == 7'h13) begin
			// I
			// not included: sltiu,srai,addiw,slliw,srliw,slaiw,ecall,ebreak,any CSRR's
			if			(I == 3'h0)
				out = in_r1 + imm; 				// addi
			else if 	(I == 3'h1 & funct7 == 7'h00)
				out = in_r1 << imm; 				// slli
			else if 	(I == 3'h2)
				out = (in_r1 < imm) ? 1:0; 	// slti
			else if 	(I == 3'h4)
				out = in_r1 ^ imm; 				// xori
			else if 	(I == 3'h5 & funct7 == 7'h00)
				out = in_r1 >> imm; 				// srli
			else if 	(I == 3'h6)
				out = in_r1 | imm; 				// ori
			else if 	(I == 3'h7)
				out = in_r1 & imm; 				// andi
			else
				out = 32'hxxxxxxxx;
		end else
				out = 32'hxxxxxxxx;
	end

endmodule

/*module xor32 (
	input  wire [`DW-1:0] a,	
	input  wire [`DW-1:0] b,	
	output wire [`DW-1:0] out
);
	integer i;
	
	for (i=0;i<DW;i=i+1) begin
		assign out[i] = a[i] ^ b[i];
	end
endmodule*/