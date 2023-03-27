### RISC-Processor-on-FPGA ###
Created by Joseph A.    
GitHub: J-oseph   
https://github.com/J-oseph/RISC-Processor-on-FPGA      
Verilog implimentation of a 5-stage RISC processor. Goal is a single core, RV32I processor.
Simulated using IVerilog and viewed with GTKWAVE on Linux.

Use this command to compile and view the results:   
  iverilog -o temp/CORE.vvp tb/tb_CORE.v && vvp temp/CORE.vvp && gtkwave temp/CORE.vcd
    
.   
.   
.   
.   
.   
.   
.   
.   
. 
### DUE TO THE CODE CURRENTLY BEING COMPLETELY REWRITTEN, THE BELOW INFORMATION IS OUT OF DATE ###
### SUPPORTED RISC-V INSTRUCTIONS ###
R: add, sub, sll, slt, xor, srl, or, and   
I: addi, slli, slti, xori, srli, ori, andi  
Please refer to a RISC-V manual to see how to use these instruction.

### HOW TO USE ###
1. In "Instruction_Mem.v", change "im_out = 32'h..." to the machine code in HEX. Use some sort of RISC V compiler and simulator (such as Venus) to get the machine code.
2. Simulate the "tb_RISC.v" using preferred simulation utility. Officially only tested with ModelSim.

### NOTES ###
-Only use supported instructions (listed above).   
-Memory stage does nothing currently, so no memory instructions are supported.   
-Program counter is only modified by testbench, so currently no branch instructions are supported.   
-Only reserved register is x0 (zero register).   
-Forwarding is supported.    
-Extra code for DE10-Lite board is included, but commented out.   
-Overflow/zero detection is not implemented.    

### TO DO ###
+ SB type instructions    
+ U  type instructions    
+ UJ type instructions    
+ Memory/S type instructions (maybe)  
