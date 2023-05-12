`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2022 21:29:11
// Design Name: 
// Module Name: TritoMeros_tb
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


module TritoMeros_tb;
    reg reset, clk, enable;
    wire an3, an2, an1, an0;
    wire a, b, c, d, e, f, g, dp;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #10 enable = 0;     //0
        #3200 enable = 1;
        #200 enable = 0;    //1
        #3400 enable = 1;
        #200 enable = 0;    //2
        #3600 enable = 1;
        #200 enable = 0;    //3
        #3500 enable = 1;
        #200 enable = 0;    //4
        #3500 enable = 1;
        #200 enable = 0;    //5
        #3300 enable = 1;
        #200 enable = 0;    //6
        #3500 enable = 1;
        #200 enable = 0;    //7
        #3600 enable = 1;
        #200 enable = 0;    //8
        #3500 enable = 1;
        #200 enable = 0;    //9
        #3500 enable = 1;
        #200 enable = 0;    //a
        #3300 enable = 1;
        #200 enable = 0;    //b
        #3500 enable = 1;
        #200 enable = 0;    //c
        #3500 enable = 1;
        #200 enable = 0;    //d
        #3300 enable = 1;
        #200 enable = 0;    //e
        #3500 enable = 1;
        #200 enable = 0;    //f
    end
    
    always #5 clk = ~clk;
    
    TritoMeros UUT (enable, reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    

endmodule
