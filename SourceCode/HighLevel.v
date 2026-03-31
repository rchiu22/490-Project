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
    output wire [3:0] opcode,
    output wire [15:0] Read_Data1, // Output1 of Read_Register1, sent through to ALU
    output wire [15:0] Read_Data2, // Output2 of Read_Register2, can either be an address to write to in Data Memory, or second register value from Read_Register2
    output wire [15:0] MuxOut,
    output wire [1:0] AO
    );
       
     wire [15:0] Read_Address;
     wire [3:0] opcode;
     wire [3:0] Read_Register1;
     wire [3:0] Read_Register2;
     wire [3:0] Register_Write;
     wire [3:0] Immediate;
     wire [11:0] Address;
     wire [3:0] Destination;
     
     wire RegWrite; 
     
     
     wire [15:0] Extended;
     wire [15:0] se;
     wire [15:0] Out;
     wire [1:0] Op;
     wire [1:0] ALUO;
    
    ProgramCounter PC(PCVal, PCOutput);
    
    assign Read_Address = PCOutput; 
    
    InstructionMemory IM(Read_Address, Instruction);
    
    assign opcode = Instruction[15:12];
    
    ControlUnit CU(opcode, RegDst, RegWrite, BEQ, BNE, Jump, ALUOp, MemRead, MemWrite, RegWriteSrc, ALUSrc);
    
    assign ALUO = ALUOp;
    assign Read_Register1 = Instruction [7:4];
    assign Read_Register2 = Instruction [11:8];
    assign Register_Write = Instruction [11:8];
    assign Immediate = Instruction [3:0];
    assign Function = Instruction [3:0];
    
    Register_File rf(clk,RegWrite,Read_Register1,Read_Register2,Register_Write,Write_Data,Read_Data1,Read_Data2);
    
    SignExtend SE(Immediate,se);
    
    assign Extended = se;
    
    Mux ALUM(Read_Data2,Extended, ALUSrc,Out); // ALUSrc = 1 would mean that you pick sign extended value
    
    assign MuxOut = Out;
    
    ALUControl ALUC (ALUO,Function,Op);
    
    assign AO = Op;
    
endmodule
