`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 18:57:10
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb;
    
    reg reset, clk;
    wire an3, an2, an1, an0;
    wire a, b, c, d, e, f, g, dp;
    //wire Tx_BUSY;
    //wire Rx_VALID, Rx_PERROR, Rx_FERROR;
    //wire [7:0] Rx_DATA;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
    end
    
    always #5 clk = ~clk;
    
    top_module UUT (reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
    
    
endmodule
