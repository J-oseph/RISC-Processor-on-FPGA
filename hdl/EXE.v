`include "hdl/definitions.v"
module EXE 
#(	parameter RFW = 5,
	parameter IMW = 4,
	parameter DW = 32,
	parameter IW = 32)
(	input wire [IW-1:0] inst,
	input wire [DW-1:0] dataA,
	input wire [DW-1:0] dataB,
	output reg [DW-1:0] data_out);

	
	wire [RFW-1:0] rs2, rs1, rd;
	wire [6:0] funct7;
	wire [6:0] opcode;
	wire [2:0] funct3;
	wire [DW-1:0] imm_I, imm_U, imm_S, imm_B, imm_J, jalr_add;

	assign imm_I	= { {20{inst[31]}}, inst[30:20] };
	assign imm_S	= { {20{inst[31]}}, inst[30:25],inst[11:7]};
	assign imm_B	= { {19{inst[31]}},inst[7],inst[30:25],inst[11:8], 1'b0};
	assign imm_U	= { {inst[31:12]}, {12'b0} };
	assign imm_J	= { {11{inst[31]}}, inst[19:12],inst[20],inst[30:21], 1'b0};
	assign funct7 	= inst[31:25];
	assign rs2 		= inst[24:20];
	assign rs1		= inst[19:15];
	assign funct3	= inst[14:12];
	assign rd		= inst[11:7 ];
	assign opcode	= inst[6 :2 ];
	assign jalr_add = dataA + imm_I;

	always @(*) begin
		if (inst[1:0] != 2'b11) begin
			$display("ERROR IN INSTRUCTION");
			$display(inst);
			data_out = 32'bX;
		end
		case (opcode)
			`OP: 
				begin
					// R
					if 			(funct3 == `ADD_F3 && funct7 == `ADD_F7) begin //ADD
						data_out = dataA + dataB;
					end else if (funct3 == `SUB_F3 && funct7 == `SUB_F7) begin //SUB
						data_out = dataA - dataB;
					end else if (funct3 == `SLL_F3 && funct7 == `SLL_F7) begin //SLL
						data_out = dataA << dataB[4:0];
					end else if (funct3 == `SLT_F3 && funct7 == `SLT_F7) begin //SLT
						data_out = $signed(dataA) < $signed(dataB);
					end else if (funct3 == `SLTU_F3 && funct7 == `SLTU_F7) begin //SLTU
						data_out = $unsigned(dataA) < $unsigned(dataB);
					end else if (funct3 == `XOR_F3 && funct7 == `XOR_F7) begin //XOR
						data_out = dataA ^ dataB;
					end else if (funct3 == `SRL_F3 && funct7 == `SRL_F7) begin //SRL
						data_out = dataA >> dataB[4:0];
					end else if (funct3 == `SRA_F3 && funct7 == `SRA_F7) begin //SRA
						data_out = $signed(dataA) >>> dataB[4:0];
					end else if (funct3 == `OR_F3 && funct7 == `OR_F7) begin //OR
						data_out = dataA | dataB;
					end else if (funct3 == `AND_F3 && funct7 == `AND_F7) begin //AND
						data_out = dataA & dataB;
					end else begin
						$display("Unknown OP!");
						data_out = 32'bX;
					end
				end
			`OP_IMM: 
				begin 
					//OP_IMM
					if 			(funct3 == `ADDI_F3) begin //ADDI
						data_out = dataA + imm_I;
					end else if (funct3 == `SLTI_F3) begin //SLTI
						data_out = $signed(dataA) < $signed(imm_I);
					end else if (funct3 == `SLTIU_F3) begin //SLTIU
						data_out = $unsigned(dataA) < $unsigned(imm_I);
					end else if (funct3 == `XORI_F3) begin //XORI
						data_out = dataA ^ imm_I;
					end else if (funct3 == `ORI_F3) begin //ORI
						data_out = dataA | imm_I;
					end else if (funct3 == `ANDI_F3) begin //ANDI
						data_out = dataA & imm_I;
					end else if (funct3 == `SLLI_F3) begin //SLLI
						data_out = dataA << imm_I[4:0];
					end else if (funct3 == `SRLI_F3) begin //SRLI
						data_out = dataA >> imm_I[4:0];
					end else if (funct3 == `SRAI_F3) begin //SRAI
						data_out = $signed(dataA) >>> imm_I[4:0];
					end else begin
						$display("Unknown OP_IMM!");
						data_out = 32'bX;
					end
				end
			`JALR: 
				begin 
					//JALR
					if 			(funct3 == `JALR_F3) begin //JALR
						data_out = (dataA + imm_I) & {{DW-1{1'b1}},1'b0};
					end else begin
						$display("Unknown JALR!");
						data_out = 32'bX;
					end
				end
			`LOAD: 
				begin 
					//LOAD
					if 			(funct3 == `LB_F3) begin //LB
						data_out = dataA + imm_I;
					end else if (funct3 == `LH_F3) begin //LH
						data_out = dataA + imm_I;
					end else if (funct3 == `LW_F3) begin //LW
						data_out = dataA + imm_I;
					end else if (funct3 == `LBU_F3) begin //LBU
						data_out = dataA + imm_I;
					end else if (funct3 == `LHU_F3) begin //LHU
						data_out = dataA + imm_I;
					end else begin
						$display("Unknown LOAD!");
						data_out = 32'bX;
					end

				end
			`SYSTEM: 
				begin 
					//SYSTEM
					if 			(funct3 == `ECALL_F3) begin //ECALL
						data_out = 32'bX;
					end else if (funct3 == `EBREAK_F3) begin //EBREAK
						data_out = 32'bX;
					end else begin
						$display("Unknown LOAD!");
						data_out = 32'bX;
					end

				end
			`STORE: 
				begin 
					//STORE
					if 			(funct3 == `SB_F3) begin //SB
						data_out = 32'bX;
					end else if (funct3 == `SH_F3) begin //SH
						data_out = 32'bX;
					end else if (funct3 == `SW_F3) begin //SW
						data_out = 32'bX;
					end else begin
						$display("Unknown STORE!");
						data_out = 32'bX;
					end

				end
			`BRANCH: 
				begin 
					//BRANCH
					if 			(funct3 == `BEQ_F3) begin //BEQ
						data_out = dataA == dataB;
					end else if (funct3 == `BNE_F3) begin //BNE
						data_out = dataA != dataB;
					end else if (funct3 == `BLT_F3) begin //BLT
						data_out = dataA < dataB;
					end else if (funct3 == `BGE_F3) begin //BGE
						data_out = dataA >= dataB;
					end else if (funct3 == `BLTU_F3) begin //BLTU
						data_out = $unsigned(dataA) < $unsigned(dataB);
					end else if (funct3 == `BGEU_F3) begin //BGEU
						data_out = $unsigned(dataA) >= $unsigned(dataB);
					end else begin
						$display("Unknown BRANCH!");
						data_out = 32'bX;
					end

				end
			`LUI: 
				begin 
					//LUI
					data_out = imm_U;
				end
			`AUIPC: 
				begin 
					//AUIPC
					data_out = imm_U;
				end
			`JAL: 
				begin 
					//JAL
					data_out = dataA + imm_J;

				end
			default:
				begin
					// $display("Unknown opcode: %b!",opcode);
				end

		endcase
	end

endmodule
