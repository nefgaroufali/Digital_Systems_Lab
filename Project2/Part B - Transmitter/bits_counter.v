`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 21:01:32
// Design Name: 
// Module Name: bits_counter
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


module bits_counter(clk, reset, counter, Tx_WR, Tx_sample_ENABLE, bits);
    
    input clk, reset, Tx_sample_ENABLE;
    input Tx_WR;
    input [3:0] counter;
    output [3:0] bits;
    
    reg [3:0] bits;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset || Tx_WR)
        begin
            bits <= 0;
        end
        else if(counter == 4'b1111 && Tx_sample_ENABLE == 1'b1)
            bits <= bits + 1;
        else
            bits <= bits;
    end
    
endmodule
