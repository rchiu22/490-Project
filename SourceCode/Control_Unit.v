`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2026 01:07:36 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input clk,
    input wire [3:0] opcode,
    output reg RegDst,
    output reg RegWrite,
    output reg BEQ,
    output reg BNE,
    output reg Jump,
    output reg [1:0] ALUOp,
    output reg MemRead,
    output reg MemWrite,
    output reg RegWriteSrc,
    output reg ALUSrc
    );
    
    always @(posedge clk)
    begin 
    case (opcode)
        4'b0000: // R-type
            begin
            RegDst = 1; // RegDst 1, means that destination is Rd, read from [11-8]
            RegWrite = 1; // RegWrite 1, means that you write to register
            BEQ = 0; // Branch 0, means you dont branch
            BNE = 0; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 10; // ALUOp 00, means it is an R-type
            MemRead = 0; // MemRead 0, means that you don't read from memory
            MemWrite = 0; // MemWrite 0, means that you don't write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use ALU computed value 
            ALUSrc = 0; //ALUSrc 0, means that you choose RD2 as second ALU Operandck8
            end
        4'b0001: // lw
            begin
            RegDst = 1; // RegDst 1, take register value from [11-8]
            RegWrite = 1; // RegWrite 1, means that you write to register
            BEQ = 0; // Branch 0, means you dont branch
            BNE = 0; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 00; // ALUOp 00, means it is an addition
            MemRead = 1; // MemRead 1, means that you read from memory
            MemWrite = 0; // MemWrite 0, means that you don't write to memory
            RegWriteSrc = 1; //RegWriteSrc = 1, means that you use value from memory
            ALUSrc = 1; //ALUSrc 1, means that you choose sign-extend immediate as second ALU Operand
            end
        4'b0010: // sw
            begin
            RegDst = 0; // RegDst 0, take register value from [11-8], doesnt matter for sw
            RegWrite = 0; // RegWrite 0, means that you dont write to register
            BEQ = 0; // Branch 0, means you dont branch
            BNE = 0; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 00; // ALUOp 00, means it is an addition
            MemRead = 0; // MemRead 0, means that you dont read from memory
            MemWrite = 1; // MemWrite 1, means that you write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use value from memory, doesnt matter for sw
            ALUSrc = 1; //ALUSrc 1, means that you choose sign-extend immediate as second ALU Operand
            end  
         4'b0011: // addi         
            begin
            RegDst = 1; // RegDst 1, take register value from [11-8]
            RegWrite = 1; // RegWrite 1, means that you write to register
            BEQ = 0; // Branch 0, means you dont branch
            BNE = 0; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 00; // ALUOp 00, means it is an addition
            MemRead = 0; // MemRead 0, means that you dont read from memory
            MemWrite = 0; // MemWrite 0, means that you dont write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use value from ALU
            ALUSrc = 1; //ALUSrc 1, means that you choose sign-extend immediate as second ALU Operand
            end
          4'b0100: // beq    
            begin
            RegDst = 0; // RegDst 0, doesn't have a register destination
            RegWrite = 0; // RegWrite 0, doesn't write to a register
            BEQ = 1; // Branch 1, branch operation
            BNE = 0; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 01; // ALUOp 01, means it is a subtraction
            MemRead = 0; // MemRead 0, means that you dont read from memory
            MemWrite = 0; // MemWrite 0, means that you dont write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use value from ALU
            ALUSrc = 0; //ALUSrc 0, means that you choose second ALU Operand from RD2 and not the sign-extend
            end
          4'b0101: // bne
            begin
            RegDst = 0; // RegDst 0, doesn't have a register destination
            RegWrite = 0; // RegWrite 0, doesn't write to a register
            BEQ = 1; // Branch 1, branch operation
            BNE = 1; // BNE 0
            Jump = 0; // Jump 0, means you dont jump
            ALUOp = 01; // ALUOp 01, means it is a subtraction
            MemRead = 0; // MemRead 0, means that you dont read from memory
            MemWrite = 0; // MemWrite 0, means that you dont write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use value from ALU
            ALUSrc = 0; //ALUSrc 0, means that you choose second ALU Operand from RD2 and not the sign-extend
           end
          4'b0110: // jump
            begin
            RegDst = 0; // RegDst 0, doesn't have a register destination
            RegWrite = 0; // RegWrite 0, doesn't write to a register
            BEQ = 0; // Branch 0, means you dont branch
            BNE = 0; // BNE 0
            Jump = 0; // Jump 1, means jump operation
            ALUOp = 00; // ALUOp 01, means it is a subtraction, doesn't matter in this 
            MemRead = 0; // MemRead 0, means that you dont read from memory
            MemWrite = 0; // MemWrite 0, means that you dont write to memory
            RegWriteSrc = 0; //RegWriteSrc = 0, means that you use value from ALU
            ALUSrc = 0; //ALUSrc 0, means that you choose second ALU Operand from RD2 and not the sign-extend
            end
        endcase
        end
endmodule
