/* 		
		CODED BY Joseph A. 
		GitHub: J-oseph
		March, 2023.
*/

/*
	THIS IS THE TEST BENCH. RUN SIMULATIONS FROM THIS FILE.
*/
`include "CORE.v"

module tb_CORE;
	reg clk;
	reg start;
	parameter RFW = 5;
	parameter IMW = 5;
	parameter DW  = 32;
	parameter IW  = 32;

	CORE #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))		core(.clk(clk),.start(start));
	
	initial begin
		$display("\n");
		$dumpfile("temp/CORE.vcd");
		$dumpvars(0, tb_CORE);

		clk = 1'b0;
		start = 1'b0;
		#1 start = 1'b1;

		#600 $display("==== Completed Simulation :D ====\n");
		$finish;
	end
	
	always begin
		#10 clk = ~clk;
	end
	
	


endmodule
