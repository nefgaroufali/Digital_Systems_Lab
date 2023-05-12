`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 18:45:26
// Design Name: 
// Module Name: variable_init
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


module variable_init(clk, Rx_DATA, new_RxDATA, Rx_VALID);
    
    input clk;
    input Rx_VALID;
    output [7:0] new_RxDATA;
    input [7:0] Rx_DATA;
    reg [7:0] new_RxDATA;
    
    always @(posedge clk)
    begin
        if(Rx_VALID == 1'b1)
            new_RxDATA <= Rx_DATA;
        else
            new_RxDATA <= new_RxDATA;
    end
    
endmodule
