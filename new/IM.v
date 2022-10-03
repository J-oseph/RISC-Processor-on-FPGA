
module IM 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire [IMW-1:0] address,
	output reg [IW-1:0] out);

	integer i;
	reg [IW-1:0] im[0:2**IMW-1];

	always @(*) begin
		case (address)
			0 		: out = 32'h000006B3;
			1 		: out = 32'h0000a237;
			2 		: out = 32'h00000013;
			3 		: out = 32'h00000013;
			4 		: out = 32'h00000013;
			5 		: out = 32'h00000013;
			6 		: out = 32'h00000013;
			7 		: out = 32'h00000013;
			8 		: out = 32'h000006B3;
			9 		: out = 32'h00000013;
			10 		: out = 32'h00000013;
			11		: out = 32'h00000013;
			12		: out = 32'h00000013;
			13		: out = 32'h00000013;
			14		: out = 32'h00000013;
			15		: out = 32'h00000013;
			default : out = 32'hXX;
		endcase
	end 

	initial begin
	  // for (i=0; i<2**IMW; i=i+1)
	  //   mem[i] = 8'h00;
	  $readmemh ("IM.txt", im);
	end

endmodule