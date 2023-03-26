
module IM 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire [IMW-1:0] address,
	output wire [IW-1:0] out);

	reg [IW-1:0] im[0:2**IMW-1];

	assign out = im[address];

	initial begin
	  $readmemh ("hdl/IM.txt", im);
	end

endmodule
