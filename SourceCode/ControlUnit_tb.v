`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 11:01:11 PM
// Design Name: 
// Module Name: ControlUnit_tb
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


module ControlUnit_tb;
    reg [3:0] opcode;
    wire RegDst;
    wire RegWrite;
    wire BEQ;
    wire BNE;
    wire Jump;
    wire [1:0] ALUOp;
    wire MemRead;
    wire MemWrite;
    wire RegWriteSrc;
    wire ALUSrc;
    
ControlUnit CU(opcode,RegDst,RegWrite,BEQ,BNE,Jump,ALUOp,MemRead,MemWrite,RegWriteSrc,ALUSrc);
    
    initial begin
   opcode = 4'b0000;
   #10 $finish;
   end
   
endmodule
