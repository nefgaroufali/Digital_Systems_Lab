`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2022 21:24:12
// Design Name: 
// Module Name: TetartoMeros_tb
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


module TetartoMeros_tb;
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
    
    TetartoMeros UUT (reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

endmodule