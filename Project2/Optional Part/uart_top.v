`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 14:48:50
// Design Name: 
// Module Name: uart_top
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


module uart_top(reset, clk, Tx_DATA, Tx_WR, Tx_EN, Tx_BUSY, Rx_DATA, baud_select, Rx_EN, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
    input reset, clk, Tx_WR, Tx_EN, Rx_EN;
    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    output Tx_BUSY;
    output Rx_VALID, Rx_PERROR, Rx_FERROR;
    output [7:0] Rx_DATA;
    wire TxD;
    wire TxD_sync;
    
    synchronizer sync (clk, TxD, TxD_sync);
    uart_transmitter trans (reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    uart_receiver rec (reset, clk, Rx_DATA, baud_select, Rx_EN, TxD_sync, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
    
endmodule
