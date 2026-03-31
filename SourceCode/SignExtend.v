`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2026 09:06:22 PM
// Design Name: 
// Module Name: SignExtend
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
      reg [3:0] Input;
      wire [15:0] se;
      
      SignExtend SE(Input,se);
      
      initial begin
      Input = 4'b0000;
      #5 Input = 4'b1000;
      
      #15 $finish;
    end
endmodule

   
    
    

