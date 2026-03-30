`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 09:38:01 PM
// Design Name: 
// Module Name: HighLevel_tb
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


module HighLevel_tb;
    reg clk;
    reg [15:0] PCVal;
    wire [15:0] PCOutput;
    wire [15:0] Instruction;
    wire RegDst, RegWrite, BEQ, BNE, Jump;
    wire [1:0] ALUOp;
    wire MemRead, MemWrite, RegWriteSrc, ALUSrc;
  

HighLevel HL(PCVal, PCOutput, Instruction, RegDst, RegWrite, BEQ, BNE, Jump, ALUOp, MemRead, MemWrite, RegWriteSrc, ALUSrc);

initial begin
   PCVal = 0;
   #10 $finish;
   end
endmodule
