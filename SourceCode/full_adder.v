`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 05:15:49 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    

    //xor the inputs assign to sum
    assign S = A ^ B ^ Cin;
    
    //Cout= And A & B then Or it with Cin And (A xor B)
    assign Cout = (A & B) | (Cin &(A ^ B));
endmodule



