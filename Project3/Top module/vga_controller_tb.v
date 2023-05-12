`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2022 12:53:58
// Design Name: 
// Module Name: vga_controller_tb
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


module vga_controller_tb;
    
    reg clk, reset;
    wire [3:0] VGA_RED, VGA_GREEN, VGA_BLUE;
    wire VGA_HSYNC, VGA_VSYNC;
    //wire new_clk;
    
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
    
    vga_controller vga(clk,reset,VGA_RED,VGA_GREEN,VGA_BLUE,VGA_HSYNC,VGA_VSYNC);
    
endmodule
