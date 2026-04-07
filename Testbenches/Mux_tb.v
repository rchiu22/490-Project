`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 06:02:58 PM
// Design Name: 
// Module Name: Mux_tb
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


module Mux_tb;
    reg [15:0] In_A;
    reg [15:0] In_B;
    reg Select;
    wire [15:0] Out;

    Mux m1(In_A, In_B, Select, Out);
    initial begin
        In_A = 16'b0001001000110100;
        In_B = 16'b0100001100100001;

        Select = 0; // choose In_A
        #2;
        Select = 1; // choose In_B
        #2;
        $finish;
    end
endmodule
