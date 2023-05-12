`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:59:26
// Design Name: 
// Module Name: big_counter
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
/*
This counter was made to play the message in the audio for enough time.
So this counter multiplys the time 0.015s that the message lasts with 400.
So the final duration is 6 seconds.
*/

module big_counter(clk, reset, big_count, prepacket, packets, thirty_two_count);
    
    input clk, reset, prepacket;
    input [9:0] packets;
    input [4:0] thirty_two_count;
    output [8:0] big_count;
    reg [8:0] big_count;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset || prepacket)
            big_count <= 9'b0;
        else if(packets == 10'd936 && thirty_two_count == 5'd31)
            big_count <= big_count + 1;
        else
            big_count <= big_count;
    end
        
    
endmodule
