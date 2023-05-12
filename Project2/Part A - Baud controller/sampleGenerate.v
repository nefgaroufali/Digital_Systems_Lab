`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 23:21:33
// Design Name: 
// Module Name: sampleGenerate
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


module sampleGenerate(clk, reset, max_value, sample_ENABLE);
    
    input clk, reset;
    input [15:0] max_value;
    output sample_ENABLE;
    reg [15:0] count;
    wire sample_ENABLE;
    
    always@(posedge clk or posedge reset)
    begin
    if (reset)
        count <= 16'b0;
    else if(count == max_value)
        count <= 16'b0;
    else
        count <= count + 1;
    end
    
    assign sample_ENABLE = (count == max_value);
        
    
endmodule
