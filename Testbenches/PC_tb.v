`timescale 1ns / 1ps

module ProgramCounter_tb;
    reg clk;
    reg reset;
    reg [15:0] PCVal; // next PC val
    wire [15:0] PCOutput; // current PC val

    ProgramCounter p1(clk, reset, PCVal, PCOutput);
    always #1 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        PCVal = 16'b0000000000000000;
        #2;
        reset = 0;
        PCVal = 16'b0000000000000010;
        #2;
        PCVal = 16'b0000000000000100;
        #2;
        $finish;
    end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 10:08:39 PM
// Design Name: 
// Module Name: PC_tb
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


module PC_tb(

    );
endmodule
