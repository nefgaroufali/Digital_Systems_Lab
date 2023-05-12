`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 15:21:34
// Design Name: 
// Module Name: uart_receiver_tb
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


module uart_receiver_tb;
    reg reset, clk;
    reg [7:0] Tx_DATA;
    reg [2:0] baud_select;
    reg Tx_EN;
    reg Tx_WR;
    wire TxD;
    wire Tx_BUSY;
    wire [7:0] Rx_DATA;
    reg Rx_EN;
    wire Rx_FERROR;
    wire Rx_PERROR;
    wire Rx_VALID;
    
    initial
    begin
        clk = 0;
        baud_select = 3'b010;
        reset = 1;
        #10 reset = 0;
        Tx_EN = 1'b1;
        Rx_EN = 1'b1;
        Tx_DATA = ({1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0});
        #200 Tx_WR = 1;
        #10 Tx_WR = 0;
        #2500000 Tx_DATA = ({1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0});
        #10 Tx_WR = 1;
        #10 Tx_WR = 0;
    end
    
    always #5 clk = ~clk;
    
    uart_transmitter trans_UUT (reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    uart_receiver rec_UUT (reset, clk, Rx_DATA, baud_select, Rx_EN, TxD, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
    
endmodule
