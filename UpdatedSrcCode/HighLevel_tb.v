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
    reg clk, reset;
    wire [15:0] PCOutput;
    wire [15:0] Instruction;
    //wire RegDst, RegWrite, BEQ, BNE, Jump;
    wire [3:0] opcode;
    //wire MemRead, MemWrite, RegWriteSrc, ALUSrc;
    wire [15:0] Read_Data1; // Output1 of Read_Register1, sent through to ALU
    wire [15:0] Read_Data2;
    wire [15:0] ALUO;
    //wire [15:0] MuxOut;
    //wire [1:0] AO; 
    //wire [3:0] Function;
  

HighLevel HL(clk,reset, PCOutput, Instruction, opcode, Read_Data1, Read_Data2, ALUO);
   
   initial clk = 0;
   always #5 clk = ~clk;

initial begin

   reset = 1;
   #7 reset = 0;
   #13 $finish;
   end
endmodule
