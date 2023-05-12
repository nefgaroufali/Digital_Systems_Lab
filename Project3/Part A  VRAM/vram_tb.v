`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2022 16:12:40
// Design Name: 
// Module Name: vram_tb
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


module vram_tb;
    
    reg clk, reset;
    reg [13:0] addr;
    
    wire red_col;
    wire green_col;
    wire blue_col;
    
    
    initial
    begin
    clk = 0;
    reset = 1;
    #100 reset =0;
    #50 addr = 14'b0;
    #50 addr = 14'b00000000000001;
    #50 addr = 14'b00000000001000;
    #50 addr = 14'b00000000010010;
    #50 addr = 14'b00000011000111;
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
    
    vram vrm (clk, reset, addr, red_col, green_col, blue_col);
endmodule
