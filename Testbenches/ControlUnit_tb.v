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
    wire RegWrite;
    wire Branch;
    wire BNE;
    wire Jump;
    wire [1:0] ALUOp;
    wire MemRead;
    wire MemWrite;
    wire RegWriteSrc;
    wire ALUSrc;
    
ControlUnit CU(opcode, RegWrite,Branch, BNE,Jump,ALUOp,MemRead,MemWrite,RegWriteSrc,ALUSrc);

    initial begin
        // R-type instructions all use 0000
        opcode = 4'b0000;
        #10;     
        // lw
        opcode = 4'b0001;
        #10;    
        // sw
        opcode = 4'b0010;
        #10;     
        // addi
        opcode = 4'b0011;
        #10;    
        // beq
        opcode = 4'b0100;
        #10;     
        // bne
        opcode = 4'b0101;
        #10;    
        // jmp
        opcode = 4'b0110;
        #10;  
        $finish;
    end
   
endmodule
