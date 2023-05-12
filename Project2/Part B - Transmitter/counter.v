`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 21:02:21
// Design Name: 
// Module Name: counter
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


module counter(clk, reset, Tx_WR, Tx_sample_ENABLE, counter);
    
    input clk, reset, Tx_sample_ENABLE, Tx_WR;
    output [3:0] counter;
    
    reg [3:0] counter;
    
    always @ (posedge clk or posedge reset)
    begin
        if(reset || Tx_WR)
            counter <= 0;
        else if(Tx_sample_ENABLE == 1'b1)
            counter <= counter + 1;
        else counter <= counter;
    end

    
endmodule
