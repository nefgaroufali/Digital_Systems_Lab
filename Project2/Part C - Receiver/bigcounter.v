`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 20:40:42
// Design Name: 
// Module Name: bigcounter
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


module bigcounter(clk, reset, Rx_sample_ENABLE, read_enable, counter);
    input clk, reset, Rx_sample_ENABLE, read_enable;
    output [7:0] counter;
    
    reg [7:0] counter;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset || (counter == 8'b10101111 && Rx_sample_ENABLE == 1'b1))
            counter <= 8'b0;
        else if(read_enable == 1'b0 && Rx_sample_ENABLE == 1'b1)
            counter <= counter + 1;
        else
            counter <= counter;
    end
            
endmodule
