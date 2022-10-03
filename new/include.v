
`timescale 1ps/1ps
`include "CORE.v"		// processor
`include "PC.v"			// program counter
`include "IM.v"			// instruction memory
`include "IF_ID.v"		// instruction fetch / instruction decode buffer
`include "ID.v"			// instruction decode
`include "RF.v"			// register file
`include "ID_EXE.v"		// instruction decode / execute buffer
`include "EXE.v"		// execute (ALU)
`include "EXE_MEM.v"	// execute / memory buffer
`include "MEM.v"		// data memory
`include "MEM_WB.v"		// memory / write back buffer
`include "WB.v"			// write back

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

