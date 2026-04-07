`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2026 09:24:56 PM
// Design Name: 
// Module Name: IM_tb
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


module IM_tb;

     reg [15:0] Read_Address;
    wire [15:0] Instruction;
    
    InstructionMemory i1(Read_Address,Instruction);
    
    integer i;
    initial
    begin
        for (i = 0; i < 20; i = i + 2)
        begin
            Read_Address = i;
            #10;
        end
    $finish;
    end

endmodule