
`timescale 1ps/1ps
// `include "hdl/definitions.v"// definitions for all of the global variables
`include "hdl/PC.v"			// program counter
`include "hdl/IM.v"			// instruction memory
`include "hdl/IF_ID.v"		// instruction fetch / instruction decode buffer
`include "hdl/ID.v"			// instruction decode
`include "hdl/RF.v"			// register file
`include "hdl/ID_EXE.v"		// instruction decode / execute buffer
`include "hdl/EXE.v"		// execute (ALU)
`include "hdl/EXE_MEM.v"	// execute / memory buffer
`include "hdl/MEM.v"		// data memory
`include "hdl/MEM_WB.v"		// memory / write back buffer
`include "hdl/WB.v"			// write back
`include "hdl/FU.v"			// forwarding unit
