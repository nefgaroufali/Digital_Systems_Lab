`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2023 01:03:10
// Design Name: 
// Module Name: clock_enable
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


module clock_enable(clk, reset, clock_count, clock_en);
    
    input clk, reset;
    input [6:0] clock_count;
    output clock_en;
    reg clock_en;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            clock_en <= 1'b0;
        else if(clock_count == 7'b01100011)
            clock_en <= 1'b1;
        else if(clock_count == 7'b01100100)
            clock_en <= 1'b0;
        else
            clock_en <= clock_en;
    end
    
endmodule
