
`timescale 1ps/1ps
`include "modules/PC.v"			// program counter
`include "modules/IM.v"			// instruction memory
`include "modules/IF_ID.v"		// instruction fetch / instruction decode buffer
`include "modules/ID.v"			// instruction decode
`include "modules/RF.v"			// register file
`include "modules/ID_EXE.v"		// instruction decode / execute buffer
`include "modules/EXE.v"		// execute (ALU)
`include "modules/EXE_MEM.v"	// execute / memory buffer
`include "modules/MEM.v"		// data memory
`include "modules/MEM_WB.v"		// memory / write back buffer
`include "modules/WB.v"			// write back

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

