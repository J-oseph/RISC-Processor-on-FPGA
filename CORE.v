`include "hdl/include.v"

module CORE
  #(
     parameter RFW = 5,
     parameter IMW = 4,
     parameter DW = 32,
     parameter IW = 32)
   (	input wire clk,
     input wire start);

  reg [IMW-1:0] pc_in;
  wire [IMW-1:0] pc_out;
  wire [IW-1:0] im_inst, if_id_inst, id_exe_inst;
  wire [RFW-1:0] addrA,addrB;
  wire [DW-1:0] imm, r1, r2, r1_o, r2_o;

  PC #(
       .RFW(RFW),
       .IMW(IMW),
       .DW(DW),
       .IW(IW)
     ) program_counter (
       .clk(clk),
       .start(start),
       .in(pc_in),
       .out_r(pc_out)
     );

  IM #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))
     instruction_memory (.address(pc_out),.out(im_inst));
  IF_ID #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))
        if_id_buffer		(.clk(clk),.in(im_inst),.out(if_id_inst));
  ID #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))
     instruction_decode	(.inst(if_id_inst),.addrA(addrA),.addrB(addrB),.imm(imm));
  RF #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))
     register_file		(.clk(clk),.reg1(addrA),.reg2(addrB),.reg1data(r1),.reg2data(r2));
  ID_EXE #(.RFW(RFW),.IMW(IMW),.DW(DW),.IW(IW))
         id_exe_buffer		(.clk(clk),.in_inst(if_id_inst),.out_inst(id_exe_inst), .r1(r1), .r2(r2), .r1_o(r1_o), .r2_o(r2_o));



  always @(posedge start)
  begin
    pc_in = 0;
  end

endmodule
