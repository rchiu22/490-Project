`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 04:14:29 PM
// Design Name: 
// Module Name: DataMemory_tb
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


module DataMemory_tb;
    reg clk;
    reg MemRead;
    reg MemWrite;
    reg [15:0] address;
    reg [15:0] write_data;
    wire [15:0] read_data;
    
    DataMemory D1(clk,MemRead,MemWrite,address,write_data,read_data);
    
    initial clk = 0;
    always #5 clk = ~clk;
    initial MemRead = 1;
    initial MemWrite = 0;
    
    always @(posedge clk) begin
    address <= address + 2;
    end
    
    initial begin
    address = 0;
    #100 $finish;
    end;
    
   
endmodule