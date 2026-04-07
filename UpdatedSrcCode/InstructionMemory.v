`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2026 03:32:15 PM
// Design Name: 
// Module Name: InstructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 01:13:15 AM
// Design Name: 
// Module Name: Instruction_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(
    input wire [15:0] Read_Address,
    output wire [15:0] Instruction
    );
    // 64 mem locations, each stores 16-bit instr
    reg [7:0] memory [0:255];

    //ignore the lowest address bit since byte-addressed
    //assign Instruction = memory[Read_Address[6:1]]; 
    //only need 6 bits for 64 instructions;
  initial begin
     $readmemb("main.mem",memory);
  end
  
  assign Instruction = {memory[Read_Address],memory[Read_Address+1]};
  

  
    

endmodule