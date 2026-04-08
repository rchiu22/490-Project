`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2026 09:39:04 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl_tb;
    reg[1:0] ALUOp; // if ALUOp is 10, then its an R-Type, 
    reg [3:0] Funct;
    wire [1:0] Op;
    
    ALUControl ALU(ALUOp,Funct,Op);
    
    initial begin
    ALUOp = 2'b10;
    Funct = 4'b0001;
    end
    
    
endmodule
