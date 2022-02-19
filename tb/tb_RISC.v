`timescale 1ps/1ps
module tb_RISC;
	wire  [1:0]	pc_in;
	wire  [1:0]	pc_out;
	wire  [31:0]	if_id_out;
	wire  [7:0]	id_exe_r1;
	wire  [7:0]	id_exe_r2;
	wire  [7:0]	exe_mem_out;
	wire  [7:0]	mem_wb_out;
	wire  		im_cs;
	wire 		  	rf_reset;
	reg 		  	rf_res;
	reg 		  	rf_writeenable;
	reg		  	clk;
	reg  [1:0]	pc_input;
	reg  			im_chipselect;
	 
	assign pc_in  		= pc_input [1:0];
	assign im_cs  		= im_chipselect;
	assign rf_reset  	= rf_res;
	assign rf_we  		= rf_writeenable;
	

	RISC risc0(.clk(clk), .pc_in(pc_in), .im_cs(im_cs), .rf_we_e(rf_we), .rf_reset(rf_reset), 
					.pc_out(pc_out), .if_id_out(if_id_out), .id_exe_r1(id_exe_r1), .id_exe_r2(id_exe_r2),
					.exe_mem_out(exe_mem_out), .mem_wb_out(mem_wb_out));
	
	initial begin
		clk = 0;
		rf_writeenable = 0;
		pc_input = 0;
		im_chipselect = 1;
		rf_res = 1;
		#51 rf_res = 0;
		
		#100 pc_input = 1;
		#100 pc_input = 2;
		#100 pc_input = 3;
		#100 pc_input = 0;
		#100 pc_input = 1;
		#100 pc_input = 2;
		#100 pc_input = 3;
		#100 pc_input = 0;
		#100 pc_input = 1;
		#100 pc_input = 2;
		#100 pc_input = 3;
		
			
		//$finish;
	end
	
	always begin
		#50 clk = ~clk;
	end
	
	


endmodule