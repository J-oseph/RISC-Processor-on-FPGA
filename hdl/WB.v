`include "hdl/definitions.v"// definitions for all of the global variables

module WB 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire 	[IW-1:0] inst,
    input wire  [RFW-1:0] rd,
	output reg  rf_we);

	wire [6:0] opcode;

	assign opcode = inst[6:2];

    always @(*) begin
        rf_we = 1'b0;

        if (opcode == `OP || opcode == `OP_IMM || opcode == `LUI) begin
            rf_we = 1'b1;
        end

        if (rd == 0) begin
            rf_we = 1'b0;
        end

    end


endmodule
