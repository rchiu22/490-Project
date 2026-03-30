`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2026 04:44:38 PM
// Design Name: 
// Module Name: data_memory
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

module DataMemory(
    input clk,
    input MemRead,
    input MemWrite,
    input wire [15:0] address,
    input wire [15:0] write_data,
    output reg[15:0] read_data
    );
    
    reg[7:0] memory [0:255];
    
    initial begin
        $readmemb("DataMemoryArray.txt",memory);
        
        end
    
    
    always @(*) begin //
        if (MemRead)
           read_data = {memory[address], memory[address+1]};       
        end
       
        always @(posedge clk) begin
            if (MemWrite)
            memory[address] <= write_data[15:8];
            memory[address+1] <= write_data[7:0]; //<= models register updates on clock edges. since we use posedge clk it will assign it when the clock rises since its word aligned addressing the last two bits are always 0
    end
endmodule