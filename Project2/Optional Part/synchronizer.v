`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 14:48:29
// Design Name: 
// Module Name: synchronizer
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
This module is a synchronizer. The purpose of the synchronizer is to ensure that
the input is stable. This is achieved by passing the input from 2 d flip flops.
The output from the 2nd flip flop will be the stable input we want for our modules.
*/
module synchronizer(clk, in, out_synced);
  
  input clk, in;
  output out_synced; 
 reg sync_flop1;
 reg sync_flop2;
  
  always @(posedge clk)
    begin
      sync_flop1 <= in;
      sync_flop2 <= sync_flop1;
    end
  assign out_synced = sync_flop2;

endmodule