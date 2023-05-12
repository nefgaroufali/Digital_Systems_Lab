`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 16:33:56
// Design Name: 
// Module Name: uart_transmitter_tb
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


module uart_transmitter_tb;
    reg reset, clk;
    reg [7:0] Tx_DATA;
    reg [2:0] baud_select;
    reg Tx_EN;
    reg Tx_WR;
    wire TxD;
    wire Tx_BUSY;
    
    initial
    begin
        clk = 0;
        baud_select = 3'b010;
        reset = 1;
        #10 reset = 0;
        Tx_EN = 1'b1;
        Tx_DATA = ({1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0});
        #200 Tx_WR = 1;
        #10 Tx_WR = 0;
        #2500000 Tx_DATA = ({1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0});
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;
    end
    
    always #5 clk = ~clk;
    
    uart_transmitter UUT (reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    
endmodule
