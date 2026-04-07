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
    
    initial begin
    //initial value
    MemRead = 0;
    MemWrite = 0;
    address = 16'd0;
    write_data = 16'd0;
    
    //Read addr 0
    MemRead = 1;
    address = 16'd0;
    #10;
    
    //read addr 2
    address = 16'd2;
    #10;
    
    //write to addr 4
    MemRead = 0;
    MemWrite = 1;
    address = 16'd4;
    write_data = 16'h0123;
    #10;
    
    //read back addr 4
    MemWrite = 0;
    MemRead = 1;
    address = 16'd4;
    #10;
    
    $finish;
    end;
    
   
endmodule