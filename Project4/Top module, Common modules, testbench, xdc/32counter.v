`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 21:22:52
// Design Name: 
// Module Name: 32counter
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
As I send the data in memory in packets of 32 bits, this counter is very useful
to count the  bits of its packet. This is a sequential system, so non blocking
assignments are used. If reset the counter is set to 0. The same happens when
the record button or the playback button are pressed. This is done so the counter
to start counting from the beggining aand not lose any bit.
*/
module ThirtyTwo_counter(clk, reset, count, Rec_butt, Play_butt);
    
    input clk, reset, Rec_butt, Play_butt;
    output [4:0] count;
    reg [4:0] count;
    
    always@(posedge clk or posedge reset)
    begin
    if(reset)
        count <= 5'b0;
    else if(Rec_butt || Play_butt)
        count <= 5'b0;
    else
        count <= count + 1;
    end 
endmodule
