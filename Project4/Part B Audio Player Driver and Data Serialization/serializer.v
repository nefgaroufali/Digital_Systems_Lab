`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2023 13:15:07
// Design Name: 
// Module Name: serializer
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
This module is a serializer. It takes as input the data in 32bit packets and by the
clock it gives the MSB of them. The serializer takes new input signal, once we are
at the last bit of the previous packet or when the playback button was pressed.
*/
module serializer(clk, thirty_two_count, Parallel_In, Serial_Out, Play_butt);
    input clk, Play_butt;
    input [4:0] thirty_two_count;
    input [31:0]Parallel_In;
    output Serial_Out;
    wire Serial_Out;
    reg [31:0]tmp;
    
    always @(posedge clk)
    begin 
        if(thirty_two_count == 5'd31 || Play_butt)
            tmp <= Parallel_In;
        else
        begin
            //Serial_Out<=tmp[3];
            tmp <= {tmp[30:0],1'b0};
        end
    end
    assign Serial_Out = tmp[31];

endmodule
