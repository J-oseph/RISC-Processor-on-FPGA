
`include "hdl/include.v"
module tb_ALU;
	parameter RFW = 5;
	parameter IMW = 4;
	parameter DW  = 32;
	parameter IW  = 32;
	integer y;
	reg [DW-1:0]a;
	reg [DW-1:0]b;
	reg [IW-1:0]inst;
	wire [IW-1:0]o;
	wire [DW-1:0]out;
		integer i;

	EXE #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))		alu(.inst(inst),.dataA(a),.dataB(b),.inst_o(o),.data_out(out));

	initial begin
		inst = 32'h8e7425b7;
		$display("\n");
		$dumpfile("ALU.vcd");
		$dumpvars(0, tb_ALU);
		a = 445;
		b = 1;
		#10 $finish;
		
	end

endmodule