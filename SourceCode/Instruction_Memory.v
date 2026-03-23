`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 01:13:15 AM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [15:0] Read_Address,
    output [15:0] Instruction
    );
    // 64 mem locations, each stores 16-bit instr
    reg [15:0] memory [0:63];

    //ignore the lowest address bit since byte-addressed
    assign Instruction = memory[Read_Address[6:1]]; //only need 6 bits for 64 instructions

    integer i;
    initial begin
        // init all instr mem locations to 0
        for (i = 0; i < 64; i = i + 1) begin
            memory[i] = 0;
        end
    end

endmodule
