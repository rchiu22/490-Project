`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 05:57:37 PM
// Design Name: 
// Module Name: ShiftLeftOne
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


module ShiftLeftOne(
    input wire [15:0] ValueToShift,
    output reg [15:0] ShiftedValue
    );
    
    always @(*)begin
    ShiftedValue = ValueToShift << 1;
    end
    
endmodule
