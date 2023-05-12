`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2022 13:17:17
// Design Name: 
// Module Name: memory_init
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
This module is to intantiate the velus of the message in memomry
*/

module memory_init(clk, reset, message);
    input clk, reset;
    output [63:0] message;
    reg [63:0] message;
    
    
    // Memory instantiation
    always@(posedge clk or posedge reset)
        if(reset)
        begin
            message[3:0] <= 0;          //message[0] = 0
            message[7:4] <= 1;          //message[1] = 1
            message[11:8] <= 2;         //message[2] = 2
            message[15:12] <= 3;        //message[3] = 3
            message[19:16] <= 4;        //message[4] = 4
            message[23:20] <= 5;        //message[5] = 5
            message[27:24] <= 6;        //message[6] = 6
            message[31:28] <= 7;        //message[7] = 7
            message[35:32] <= 8;        //message[8] = 8
            message[39:36] <= 9;        //message[9] = 9
            message[43:40] <= 'hA;      //message[10]= A
            message[47:44] <= 'hB;      //message[11]= b
            message[51:48] <= 'hC;      //message[12]= C
            message[55:52] <= 'hD;      //message[13]= d
            message[59:56] <= 'hE;      //message[14]= E
            message[63:60] <= 'hF;      //message[15]= F
        end
        else
        begin
            message[3:0] <= 0;          //message[0] = 0
            message[7:4] <= 1;          //message[1] = 1
            message[11:8] <= 2;         //message[2] = 2
            message[15:12] <= 3;        //message[3] = 3
            message[19:16] <= 4;        //message[4] = 4
            message[23:20] <= 5;        //message[5] = 5
            message[27:24] <= 6;        //message[6] = 6
            message[31:28] <= 7;        //message[7] = 7
            message[35:32] <= 8;        //message[8] = 8
            message[39:36] <= 9;        //message[9] = 9
            message[43:40] <= 'hA;      //message[10]= A
            message[47:44] <= 'hB;      //message[11]= b
            message[51:48] <= 'hC;      //message[12]= C
            message[55:52] <= 'hD;      //message[13]= d
            message[59:56] <= 'hE;      //message[14]= E
            message[63:60] <= 'hF;      //message[15]= F
        end
    
endmodule
