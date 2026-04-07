`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2026 05:36:52 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
reg [15:0] Op1; 
reg [15:0] Op2;
reg [1:0] ALUControl;
wire [15:0] Output;
wire ZF;

ALU a1(Op1, Op2, ALUControl, Output, ZF);


initial begin
    //ADD
    Op1 = 16'b0000000001000001;
    Op2 = 16'b0000000000000011;
    ALUControl = 2'b00;
    #10
    
    //SUB
    Op1 = 16'b0000000001000001;
    Op2 = 16'b0000000000000011;
    ALUControl = 2'b01;
    #10
    // AND
    Op1 = 16'b0000000001000001;
    Op2 = 16'b0000000000000001;
    ALUControl = 2'b10;
    #10;
    // SLL
    Op1 = 16'b0000000001000001;
    Op2 = 16'b0000000000000001;
    ALUControl = 2'b11;
    #10;
    $finish;
    end
endmodule
