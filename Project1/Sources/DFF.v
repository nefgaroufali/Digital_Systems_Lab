`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2022 18:42:07
// Design Name: 
// Module Name: DFF
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


module DFF(clk, D, Q);
    input clk;
    input D;
    output Q;
    //output Qbar;
    
    reg Q;
    reg Qbar;
    
    always@(posedge clk)
    begin
        Q<=D;
    end
    
endmodule
