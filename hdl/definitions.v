///*** OPCODES ***///
// R-TYPE
`define OP 		12 	//01100
// I-TYPE
`define OP_IMM 	4	//00100
`define JALR 	25	//11001
`define LOAD 	0	//00000
`define SYSTEM 	28	//11100
// S-TYPE
`define STORE 	8	//01000
// B-TYPE
`define BRANCH 	24	//11000
// U-TYPE
`define LUI 	13	//01101 
`define AUIPC 	5	//00101
// J-TYPE
`define JAL 	27	//11011

///*** FUNCT3 ***///
// R-TYPE
`define ADD_F3	0	//000 	//OP
`define SUB_F3	0	//000
`define SLL_F3	1	//001
`define SLT_F3	2	//010
`define SLTU_F3	3	//011
`define XOR_F3	4	//100
`define SRL_F3	5	//101
`define SRA_F3	5	//101
`define OR_F3	6	//110
`define AND_F3	7	//111
// I-TYPE
`define ADDI_F3		0	//000 	//OP_IMM
`define SLTI_F3		2	//010
`define SLTIU_F3	3	//011
`define XORI_F3		4	//100
`define ORI_F3		6	//110
`define ANDI_F3		7	//111
`define SLLI_F3		1	//001
`define SRLI_F3		5	//101
`define SRAI_F3		5	//101

`define JALR_F3		0	//000 	//JALR

`define LB_F3		0	//000 	//LOAD
`define LH_F3		1	//001
`define LW_F3		2	//010
`define LBU_F3		4	//100
`define LHU_F3		5	//101

`define ECALL_F3	0	//000 	//SYSTEM
`define EBREAK_F3	0	//000

// S-TYPE
`define SB_F3		0	//000 	//STORE
`define SH_F3		1	//001
`define SW_F3		2	//010

// B-TYPE
`define BEQ_F3		0	//000 	//BRANCH
`define BNE_F3		1	//001
`define BLT_F3		4	//100
`define BGE_F3		5	//101
`define BLTU_F3		6	//110
`define BGEU_F3		7	//111
// U-TYPE	// no funct3 for U-TYPE
// J-TYPE	// no funct3 for J-TYPE

///*** FUNCT7 ***///
// R-TYPE	(ONLY FOR R-TYPE)
`define ADD_F7	0	//0000000 	//OP
`define SUB_F7	32	//0100000
`define SLL_F7	0	//0000000
`define SLT_F7	0	//0000000
`define SLTU_F7	0	//0000000
`define XOR_F7	0	//0000000
`define SRL_F7	0	//0000000
`define SRA_F7	32	//0100000
`define OR_F7	0	//0000000
`define AND_F7	0	//0000000
