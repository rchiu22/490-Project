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

module data_memory(
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] address,
    input [31:0] write_data,
    output reg[31:0] read_data
    );
    
    reg[31:0] memory [0:255];
    
    always @(*) begin //
        if (MemRead)
           read_data = memory[address[31:2]];
        else 
            read_data = 32'b0; //32'b0 just = 32 zeros in binary
        
        end
        
        always @(posedge clk) begin
            if (MemWrite)
            memory[address[31:2]] <= write_data; //<= models register updates on clock edges. since we use posedge clk it will assign it when the clock rises since its word aligned addressing the last two bits are always 0
    end
endmodule
