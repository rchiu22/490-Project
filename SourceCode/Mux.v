`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2026 09:33:05 PM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [15:0] In_A,
    input [15:0] In_B,
    input Select,
    output [15:0] Out
    );
    assign Out = Select ? In_B : In_A;
endmodule

module Mux4(
    input [3:0] In_A,
    input [3:0] In_B,
    input Select,
    output [3:0] Out
    );
    assign Out = Select ? In_B : In_A;

endmodule
