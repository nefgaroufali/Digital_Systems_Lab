`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 22:07:43
// Design Name: 
// Module Name: shifter
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
This module is a shifter and its functionallity is the deserialization. In fact it takes
as input bit by bit the data of the microphone and gives as output a 32 bit signal.
The desiarilization is done by the clock.
*/

module shifter(clk, micDataPDM, shifted_micData);
    input micDataPDM;
    input clk;
    output [31:0] shifted_micData;
    wire [31:0] shifted_micData;
    reg [31:0] tmp;
    
    always @(posedge clk)
    begin
        tmp <= {tmp[30:0], micDataPDM};
    end
    
    assign shifted_micData = tmp;
endmodule