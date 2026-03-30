`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 08:26:17 PM
// Design Name: 
// Module Name: HighLevel
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


module HighLevel( // starting from PC to InstructMem, then add MUX
    input wire clk,
    input wire [15:0] PCVal,
     output wire [15:0] PCOutput,
     output wire [15:0] Instruction,
    output wire RegDst, RegWrite, BEQ, BNE, Jump,
    output wire [1:0] ALUOp,
    output wire MemRead, MemWrite, RegWriteSrc, ALUSrc,
    output reg [15:0] Read_Data1, // Output1 of Read_Register1, sent through to ALU
    output reg [15:0] Read_Data2 // Output2 of Read_Register2, can either be an address to write to in Data Memory, or second register value from Read_Register2
    );
       
     wire [15:0] Read_Address;
     wire [3:0] opcode;
     wire [3:0] Read_Register1;
     wire [3:0] Read_Register2;
     wire [3:0] Register_Write;
     wire [3:0] ALUOp;
     wire [3:0] Immediate;
     wire [11:0] Address;
     
    
    ProgramCounter PC(PCVal, PCOutput);
    assign Read_Address = PCOutput; 
    InstructionMemory IM(Read_Address, Instruction);
    assign opcode = Instruction[15:12];
    ControlUnit CU(opcode, RegDst, RegWrite, BEQ, BNE, Jump, ALUOp, MemRead, MemWrite, RegWriteSrc, ALUSrc);
    assign Read_Register1 = Instruction [8:6];
    assign Read_Register2 = Instruction [11:9];
    
    
    assign Immediate = Instruction [3-0];
    assign ALUOp = Instruction [3-0];
    Register_File rf(clk,RegWrite,Read_Register1,Read_Register2,Register_Write, Write_Data,Read_Data1,Read_Data2);
  
    
endmodule
