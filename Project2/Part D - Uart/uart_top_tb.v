`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 10:37:11
// Design Name: 
// Module Name: uart_top_tb
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


module uart_top_tb;
    
    reg reset, clk, Tx_WR, Tx_EN, Rx_EN;
    reg [7:0] Tx_DATA;
    reg [2:0] baud_select;
    wire Tx_BUSY;
    wire Rx_VALID, Rx_PERROR, Rx_FERROR;
    wire [7:0] Rx_DATA;
    
    reg flag;
    
    initial
    begin
        clk = 0;
        flag = 1'b0;
        baud_select = 3'b010;
        reset = 1;
        #10 reset = 0;
        Tx_EN = 1'b1;
        Rx_EN = 1'b1;
        //Tx_DATA = ({1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0});
        //#200 Tx_WR = 1;
        //#10 Tx_WR = 0;
    end
    
    always #5 clk = ~clk;
    
    uart_top UUT(reset, clk, Tx_DATA, Tx_WR, Tx_EN, Tx_BUSY, Rx_DATA, baud_select, Rx_EN, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
    always @(posedge clk)
    begin
        if(Tx_BUSY == 1'b0 && flag == 1'b0)
        begin
            Tx_DATA = ({1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0});
            //Tx_DATA = ({1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0});
            Tx_WR <= 1;
        end
        
        if(Tx_BUSY == 1'b1 && flag == 1'b0)
            flag = 1'b1;
        
        if(Tx_WR == 1'b1)
            Tx_WR <= 0;
        
        
        if(Tx_BUSY == 1'b0 && flag == 1'b1)
        begin
            Tx_DATA = ({1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0});
            Tx_WR <= 1;
        end
        
        
        
        
    end
endmodule
