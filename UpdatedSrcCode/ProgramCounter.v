`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 03:32:14 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk,reset,
    input wire [15:0] PCVal,
    output reg [15:0] PCOutput
    );
    
    always @(posedge clk ) begin  
    
    if (reset)begin
    PCOutput <= 16'b0;
    end
    else
    PCOutput <= PCVal;
    end
 
    
endmodule
