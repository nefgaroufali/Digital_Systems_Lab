`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2023 00:52:09
// Design Name: 
// Module Name: clock_counter
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

module clock_counter(clk, reset, clock_count);
    
    input clk, reset;
    output [6:0] clock_count;
    reg [6:0] clock_count;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            clock_count <= 7'b0;
        else if(clock_count == 7'b01100100)
            clock_count <= 7'b0000001;
        else
            clock_count <= clock_count + 1;
    end
endmodule
