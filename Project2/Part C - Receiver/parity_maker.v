`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2022 18:35:07
// Design Name: 
// Module Name: parity_maker
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


module parity_maker(Tx_DATA, parity);
    
    input [7:0] Tx_DATA;
    output parity;
    reg parity;
    
    always@(Tx_DATA)
        parity = Tx_DATA[7] + Tx_DATA[6] + Tx_DATA[5] + Tx_DATA[4] + Tx_DATA[3] + Tx_DATA[2] + Tx_DATA[1] + Tx_DATA[0];
    
    
endmodule
