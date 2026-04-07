`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2026 09:42:47 PM
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


module SignExtend(
    input wire [3:0] Input,
    output reg [15:0] se
    );

    always @(*)
    se = {{12{Input[3]}}, Input};
    
 endmodule   
