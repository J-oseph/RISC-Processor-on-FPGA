/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		February 20, 2022.
*/

/*
	THIS IS THE TEST BENCH. RUN SIMULATIONS FROM THIS FILE.
*/
`include "include.v"


`define RFW 5
`define IMW 4
`define DW  32
`define IW  32
`timescale 1ps/1ps
module tb_RISC;
	wire  [`IMW-1:0]	pc_in;
	wire  [`IMW-1:0]	pc_out;
	wire  [`IW-1:0]	if_id_out;
	wire  [`DW-1:0]	id_exe_r1;
	wire  [`DW-1:0]	id_exe_r2;
	wire  [`DW-1:0]	exe_mem_out;
	wire  [`DW-1:0]	mem_wb_out;
	wire  				im_cs;
	wire 		  			rf_reset;
	reg 		  			rf_res;
	reg 		  			rf_writeenable;
	reg		  			clk;
	reg  	[`IMW-1:0]	pc_input;
	reg  					im_chipselect;
	 
	assign pc_in  		= pc_input [`IMW-1:0];
	assign im_cs  		= im_chipselect;
	assign rf_reset  	= rf_res;
	assign rf_we  		= rf_writeenable;
	
	

	RISC risc0(	.clk(clk), 					.pc_in(pc_in), 				.im_cs(im_cs), 				.rf_we_e(rf_we), 
				.rf_reset(rf_reset),		.pc_out(pc_out), 			.if_id_out(if_id_out), 		.id_exe_r1(id_exe_r1),
				.id_exe_r2(id_exe_r2),		.exe_mem_out(exe_mem_out), 	.mem_wb_out(mem_wb_out));
	
	initial begin
		$dumpfile("RISC.vcd");
		$dumpvars(0, tb_RISC);

		clk = 0;
		rf_writeenable = 0;
		pc_input = 0;
		im_chipselect = 1;
		rf_res = 1;
		#51 rf_res = 0;
		
		#49 pc_input = pc_input + 1;
		#100 pc_input = pc_input + 1;
		#100 pc_input = pc_input + 1;
		#100 pc_input = pc_input + 1;
		#45  rf_writeenable = 1;
		#55  pc_input = pc_input + 1;
		repeat(32) begin
			#100 pc_input = pc_input + 1;
		end

		#100 $display("Completed");
		$finish;
	end
	
	always begin
		#10 clk = ~clk;
	end
	
	


endmodule