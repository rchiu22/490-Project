`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 05:43:46 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(

    input clk,
    input RegWrite, // from RegWrite flag in Control Unit
    input wire [3:0] Read_Register1, // Read Register1 
    input wire [3:0] Read_Register2, // Read Register2
    input wire [3:0] Register_Write, // Read Destination Register to write to
    input wire [15:0] Write_Data, // Data that is written back, 16 bits wide
    output reg [15:0] Read_Data1, // Output1 of Read_Register1, sent through to ALU
    output reg [15:0] Read_Data2 // Output2 of Read_Register2, can either be an address to write to in Data Memory, or second register value from Read_Register2
    );
    
    reg [15:0] reg_file [3:0]; // declaring register array, data type of 16 bit arrays and 2^4 array elements
    
    always @(posedge clk)
    begin
        if (RegWrite) begin 
            reg_file[Register_Write] <= Write_Data;
        end
    end
        
    always @(negedge clk)    
    begin
         assign Read_Data1 = reg_file[Read_Register1];
         assign Read_Data2 = reg_file[Read_Register2];
         
    end
    
endmodule
