`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 22:06:42
// Design Name: 
// Module Name: address_counter
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
This module is to change the address. The address is 16 bits according to the manual.
The MSB is set always to 1. According to the manual we use to change the value of the address
the bits [14:5] the rest bits are dont cares, and we increase the value of the address by 1.
Instead of this I used the whole signal [14:0] and increase the value by 32. In this way the 
result is the same as it is done an addition by 1in the [14:5] signal.

Now if reset the address is set to 0. The same is done when the record and paly buttons are pushed.
If we have reached the final value of the address we use the address is set to 0 again. The address
increases as we reach the last bit of the packet.
*/
module address_counter(clk, reset, thirty_two_count, Rec_butt, Play_butt, address, prepacket);
    
    input clk, reset, Rec_butt, Play_butt, prepacket;
    input [4:0] thirty_two_count;
    output [15:0] address;
    
    reg [15:0] address;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            address[14:0] <= 15'b0;
            address[15] <= 1'b1;
        end
        else if(Rec_butt || Play_butt)
        begin
            address[14:0] <= 15'b0;
            address[15] <= 1'b1;
        end
        else if(prepacket)
        begin
            address[14:0] <= address[14:0] + 15'd32;
            address[15] <= 1'b1;
        end
        else if(address == 16'd62720 && thirty_two_count == 5'd31)
        begin
            address[14:0] <= 15'b0;
            address[15] <= 1'b1;
        end
        else if(thirty_two_count == 5'd31)
        begin
            address[14:0] <= address[14:0] + 15'd32;
            address[15] <= 1'b1;
        end
        else
        begin
            address <= address;
        end
    end
        
    
endmodule