`timescale 1ns / 1ps

module RegFile_tb;
    reg clk;
    reg RegWrite; // from RegWrite flag in Control Unit
    reg [3:0] Read_Register1; // Read Register1 
    reg [3:0] Read_Register2; // Read Register2
    reg [3:0] Register_Write; // Read Destination Register to write to
    reg [15:0] Write_Data; // Data that is written back, 16 bits wide
    wire [15:0] Read_Data1; // Output1 of Read_Register1, sent through to ALU
    wire [15:0] Read_Data2; // Output2 of Read_Register2, can either be an address to write to in Data Memory, or second register value from Read_Register2
    
    Register_File rf(clk, RegWrite, Read_Register1, Read_Register2, Register_Write, Write_Data, Read_Data1, Read_Data2);

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        RegWrite = 0;
        Register_Write = 4'b0;
        Write_Data = 16'b0;
        Read_Register1 = 4'b0;
        Read_Register2 = 4'b0;
        
        // write 4 into register 3
        #10;
        RegWrite = 1;
        Register_Write = 4'b0011;
        Write_Data = 16'b0000000000000100;
        #10;
        RegWrite = 0;
        Read_Register1 = 4'b0011;
        Read_Register2 = 4'b0000;
        // write 10 into register 5
        #10;
        RegWrite = 1;
        Register_Write = 4'b0101;
        Write_Data = 16'b0000000000001010;
        #10;
        RegWrite = 0;
        Read_Register1 = 4'b0011;
        Read_Register2 = 4'b0101;
        #10;
        $finish;
    end

endmodule
