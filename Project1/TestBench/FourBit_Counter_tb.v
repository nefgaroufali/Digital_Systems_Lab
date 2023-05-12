`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2022 21:46:51
// Design Name: 
// Module Name: FourBit_Counter_tb
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


module FourBit_Counter_tb;
    
    reg clk,reset;
    wire [3:0] count;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
    
    FourBit_Counter counter_instance (clk,reset,count);
    
endmodule
