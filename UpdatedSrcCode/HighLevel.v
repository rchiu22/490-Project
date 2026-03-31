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
    output wire [1:0] AO, // this is to visually see the ALUOp
    output wire [3:0] Function
    );
     
     wire BEQ;
     wire [15:0] PCPlus2; 
     wire ZFDC; 
     wire [15:0] Read_Address;
     wire [3:0] Read_Register1;
     wire [3:0] Read_Register2;
     wire [3:0] Register_Write;
     wire [3:0] Immediate;
     wire [11:0] Address;
     wire [3:0] Destination;
     wire [15:0] se;
     wire RegWrite; 
     wire MemWrite;
     wire MemRead;
     wire BNE;
     wire [15:0] Extended;
     wire [15:0] se;
     wire [15:0] Out;
     wire [1:0] Op;
     wire [1:0] ALUOp; // testing for ALUOp
     wire [15:0] ALUOutput;
     wire ZF;
     wire [15:0] read_data; // this is what would be the output of datamemory
     wire [15:0] MemOutput; // output of mux between DM and ALU
     wire [15:0] Write_Data;
     wire [15:0] PCIncrementShiftedJA;
     wire [11:0] TwelveBitJA;
     wire [15:0] ShiftedSignExtension;
     wire [15:0] PCIncrementSE;
     wire BNEXORZF; // this is result of XOR that is used to check if it as a BNE/BEQ op 
     wire [15:0] BranchMuxResult; // result of first MUX that checks if its a branch or not
     
    ProgramCounter PC(PCVal, PCOutput);
    
    assign Read_Address = PCOutput; 
    
    InstructionMemory IM(Read_Address, Instruction);
    
    assign opcode = Instruction[15:12];
    
    ControlUnit CU(opcode, RegDst, RegWrite, BEQ, BNE, Jump, ALUOp, MemRead, MemWrite, RegWriteSrc, ALUSrc);
    
    assign Read_Register1 = Instruction [7:4];
    assign Read_Register2 = Instruction [11:8];
    assign Register_Write = Instruction [11:8];
    assign Immediate = Instruction [3:0];
    assign Function = Instruction [3:0];
    assign TwelveBitJA = Instruction [11:0];
    
    Register_File rf(clk,RegWrite,Read_Register1,Read_Register2,Register_Write,Write_Data,Read_Data1,Read_Data2);
    
    ALU PCIncrement (PCVal, 16'b10, 2'b00, PCPlus2, ZFDC);
    
    SignExtend SE(Immediate,se);
    
    Mux ALUM(Read_Data2,se, ALUSrc,Out); // ALUSrc = 1 would mean that you pick sign extended value
    
    assign MuxOut = Out;
    
    ALUControl ALUC (ALUOp,Function,Op);
    
    assign AO = ALUOp;
    
    ALU AL(Read_Data1,MuxOut,Op, ALUOutput, ZF);
    
    DataMemory DM(clk,MemRead, MemWrite, ALUOutput,Read_Data2,read_data);
    
    Mux MemMux(ALUOutput,Read_Data2, RegWriteSrc, MemOutput);
    
    assign Write_Data = MemOutput;
    
    assign PCIncrementSE = (se << 1 ) + PCPlus2;
    
    assign PCIncrementJA = (TwelveBitJA<<1) + PCPlus2;
    
    assign BNEXORZF = BNE ^ ZF;
    
    assign BNEXORZFANDBRANCH = BNEXORZF & BEQ;
    
    Mux BranchMux(PCPlus2,PCIncrementSE, BNEXORZFANDBRANCH, BranchMuxOutput);
    
endmodule
