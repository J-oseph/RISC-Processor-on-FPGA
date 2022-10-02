
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


