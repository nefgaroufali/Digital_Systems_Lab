`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 23:40:19
// Design Name: 
// Module Name: baud_controller_tb
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


module baud_controller_tb;
    
    reg clk, reset;
    reg [2:0] baud_select;
    wire sample_ENABLE;
    
    
    initial
    begin
        clk = 0;
        baud_select = 3'b001;
        reset = 1;
        #10 reset = 0;
    end
    
    always #5 clk = ~clk;
    
    baud_controller UUT (reset,clk,baud_select,sample_ENABLE);
    
endmodule
