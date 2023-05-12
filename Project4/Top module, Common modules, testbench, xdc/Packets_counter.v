`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 21:29:00
// Design Name: 
// Module Name: Packets_counter
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
This module is a counter for the 32bit packets. It is a sequential system, so
it is constructed by non blocking aassignments. If reset the counter is set to 0.
The same happens if the record button or the play button are pressed. This happens
so the counter to start counting from 0 and not lose any bit. The counter counts
from 0 to 936 --> 937 packets. So if the counter reaches the value 936 and we are
at the last bit the counter will be set to 0 in the next clock. The counter increases
its value once we are at the last bit of the previous packet. In any other case it 
reserves the previous value.

If we are at the playback time we lose a packet inorder to fetch the data from the
memory. This is called prepacket. So if the prepacket has passed we set the value of the
counter to 0 to count the packets we read from the memory.
*/
module Packets_counter(clk, reset, thirty_two_count, packets, Rec_butt, Play_butt, prepacket);
    
    input clk, reset, Rec_butt, Play_butt, prepacket;
    input [4:0] thirty_two_count;
    output [9:0] packets;
    
    reg [9:0] packets;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            packets <= 10'b0;
        end
        else if(Rec_butt || Play_butt)
            packets <= 10'b0;
        else if(prepacket)
        begin
            packets <= 10'd0;
        end
        else if(packets == 10'd936 && thirty_two_count == 5'd31)
        begin
            packets <= 10'b0;
        end
        else if(thirty_two_count == 5'd31)
        begin
            packets <= packets + 1;
        end
        else
        begin
            packets <= packets;
        end
    end
        
    
endmodule
