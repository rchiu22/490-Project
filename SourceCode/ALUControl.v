`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2026 05:45:29 PM
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


module ALUControl(
    input clk,
    input wire[1:0] ALUOp, // if ALUOp is 10, then its an R-Type, 
    input wire [3:0] Funct,
    output reg [1:0] Op
    );
    
    always @ (posedge clk)begin
    case (ALUOp)
    2'b00: // 00 is for addition
    Op = 2'b00;
    2'b01: // 01 is for subtraction
    Op = 2'b01;
    2'b10: // 10 is for R-format
    begin
    
    case(Funct)
    4'b0000: // add
    Op = 2'b00;
    4'b0001: // subtract
    Op = 2'b01;
    4'b0010: // sll
    Op = 2'b11;
    4'b0011: // and
    Op = 2'b10;
    endcase
    end
    endcase
    end
    
endmodule
