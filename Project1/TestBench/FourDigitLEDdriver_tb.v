`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 11:11:04
// Design Name: 
// Module Name: FourDigitLEDdriver_tb
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


module FourDigitLEDdriver_tb;
    
    reg reset, clk;
    wire an3, an2, an1, an0;
    wire a, b, c, d, e, f, g, dp;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
    end
    
    always #5 clk = ~clk;
    
    FourDigitLEDdriver UUT (reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    
endmodule
