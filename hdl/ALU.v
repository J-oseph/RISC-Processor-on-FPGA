module ALU (
	input  wire [7:0] 	in_r1,	
	input  wire [7:0] 	in_r2,
	input  wire [31:0] 	in_inst,	
	output reg  [7:0] 	out
);

	//R type:	funct7[6:0] rs2[4:0] rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 7+5+5+3+5+7
	//I type:	imm[11:0] 				rs1[4:0] funct3[2:0] rd[4:0] opcode[6:0] 12 +5+3+5+7
	
	wire [6:0] funct7, opcode;
	wire [2:0] funct3;
	
	assign funct7 	= in_inst[31:25];
	assign funct3	= in_inst[14:12];
	assign opcode	= in_inst[6 :0 ];

	always @(*) begin
		if (funct7 == 7'b0000000 & funct3 == 3'b000 & opcode == 7'b0110011) begin
			out = in_r1 + in_r2;
		end else begin
			out = 0;
		end
		
	end

endmodule