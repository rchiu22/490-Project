`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2026 04:53:42 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
    input wire [15:0] Op1,
    input wire [15:0] Op2,
    input wire [1:0] ALUControl,
    output reg [15:0] Output,
    output reg ZF
    );
    
    always @(*)
    begin
    case (ALUControl)
    2'b00: // add 
    Output = Op1 + Op2;
    2'b01: // subtraction
    begin
    Output = Op1 - Op2;
    if (Output==0)
    ZF = 0;
    else
    ZF = 1;
    end
    2'b11: // SLL
    Output = Op1 << Op2;
    2'b10: // AND
    Output = Op1 & Op2;
    endcase
    end
endmodule
