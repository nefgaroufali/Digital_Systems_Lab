`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2022 19:03:39
// Design Name: 
// Module Name: FourBitEnableCounter_tb
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


module FourBitEnableCounter_tb;
        
    reg enable,clk,reset;
    wire [3:0] count;

    initial
    begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #10 enable = 1;
        #5 enable = 0;
        #10 enable = 1;
        #5 enable = 0;   
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
    
    FourBitEnableCounter counter_instance (clk,reset,enable,count);
    
endmodule
