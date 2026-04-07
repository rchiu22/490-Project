`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 09:38:55 PM
// Design Name: 
// Module Name: SignExtend_tb
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


module SignExtend_tb;

    reg [3:0] Input; // 4-bit input value
    wire [15:0] se; // 16-bit sign-extended output

    SignExtend s1(Input, se);
    initial begin
        Input = 4'b0000;
        #10;      
        Input = 4'b0011;
        #10;      
        Input = 4'b0111;
        #10;       
        Input = 4'b1000;
        #10;       
        Input = 4'b1010;
        #10; 
        Input = 4'b1111;
        #10;     
        $finish;
    end
endmodule
