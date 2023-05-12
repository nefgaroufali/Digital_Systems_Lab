`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2022 15:53:43
// Design Name: 
// Module Name: Clock_Divider_tb
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


module Clock_Divider_tb;
    
    reg clk, reset;
    wire clk5, clk500;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #100 reset = 0;
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
       
    Clock_Division div(clk, reset, clk500, clk5);   
     
endmodule
