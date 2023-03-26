/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/

/*
	THIS IS THE TOP LEVEL FILE, BESIDES THE TEST BENCH.
*/
`define RFW 5
`define IMW 4
`define DW  32
`define IW  32
module RISC(
	input  wire 				clk,
	input  wire [`IMW-1:0]	pc_in,
	input	 wire					im_cs,
	input	 wire					rf_we_e,
	input	 wire					rf_reset,
	output wire [`IMW-1:0] 	pc_out,
	output wire [`IW-1:0] 	if_id_out,
	output wire [`DW-1:0] 	id_exe_r1,
	output wire [`DW-1:0] 	id_exe_r2,
	output wire [`DW-1:0] 	exe_mem_out,
	output wire [`DW-1:0] 	mem_wb_out
);
	wire [`IW-1:0] 	im_out, id_exe_out_inst, exe_mem_inst, mem_wb_inst;
	wire [`DW-1:0] 	wdata, rf_r1, rf_r2, alu_out;
	wire [`RFW-1:0] 	reg1, reg2, wreg;
	
	Program_Counter pc0		(.clk(clk), .in(pc_in), .out(pc_out));
	
	Instruction_Mem im0		(.address(pc_out), .im_cs(im_cs), .im_out(im_out));
	
	IF_ID IF_ID0				(.clk(clk), .in(im_out), .out(if_id_out));
	
	Instruction_Decode id0	(.in_inst(if_id_out), .reg1(reg1), .reg2(reg2));
	
	Register_File rf0			(.clk(clk), .rf_we(rf_we), .rf_reset(rf_reset), .alu_forward_inst(id_exe_out_inst), .mem_forward_inst(exe_mem_inst), .reg1(reg1), .reg2(reg2), .wreg(wreg), .wdata(wdata), .alu_rf_forward(alu_out), .mem_rf_forward(exe_mem_out), .reg1data(rf_r1), .reg2data(rf_r2));
									 
	ID_EXE id_exe0				(.clk(clk), .in_r1(rf_r1), .in_r2(rf_r2), .in_inst(if_id_out), .out_r1(id_exe_r1), .out_r2(id_exe_r2), .out_inst(id_exe_out_inst));
	
	ALU alu0						(.in_r1(id_exe_r1), .in_r2(id_exe_r2), .in_inst(id_exe_out_inst), .out(alu_out));
	
	EXE_MEM exe_mem0			(.clk(clk), .in(alu_out), .in_inst(id_exe_out_inst), .out(exe_mem_out), .out_inst(exe_mem_inst));
	
	MEM_WB mem_wb0				(.clk(clk), .in_data(exe_mem_out), .in_inst(exe_mem_inst), .out_data(mem_wb_out), .out_inst(mem_wb_inst));
	
	Write_Back_Logic wbl0	(.in_data(mem_wb_out), .in_inst(mem_wb_inst), .rf_we_e(rf_we_e), .rf_we(rf_we), .wdata(wdata), .wreg(wreg));
	
endmodule












	/*/////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW*/


	/*//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	///////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,*/
	/*/////////// VGA //////////
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,

	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,

	//////////// Arduino //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N*/
