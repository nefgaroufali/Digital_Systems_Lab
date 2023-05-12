`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 22:37:25
// Design Name: 
// Module Name: baud_controller
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


module baud_controller(reset,clk,baud_select,sample_ENABLE);
    
    input clk, reset;
    input [2:0] baud_select;
    output sample_ENABLE;
    wire [15:0] max_value;
    
    baudSelection sel(baud_select, max_value);
    sampleGenerate sample1(clk, reset, max_value, sample_ENABLE);
    
    
endmodule
