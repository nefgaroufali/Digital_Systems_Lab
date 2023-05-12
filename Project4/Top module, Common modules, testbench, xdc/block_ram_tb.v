`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2023 10:48:25
// Design Name: 
// Module Name: block_ram_tb
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


module block_ram_tb;
    
    reg clk, reset;
    reg [15:0] address;
    reg [31:0] data_in;
    wire [31:0] data_out;
    reg [3:0] write_enable;
    integer i;
    
    initial
    begin
        clk = 0;
        address = 16'b1000000000000000;
        write_enable = 4'b1111;
        reset = 1;
        #100 reset = 0;
        data_in = 32'b11111111111111111111111111111111;
        #20 address = 16'b1000000000111111;
        /*#20 address = address + 1;
        #20 address = address + 1;
        #20 address = address + 1;
        #20 address = address + 1;
        #20 address = address + 1;*/
        #20 address = 16'b1000000001011011;
        data_in = 32'b10111011110110101011011101110111;
        #20 address = 16'b1000000010111111;
        #20 address = 16'b1000000101111111;
        #20 address = 16'b1000001111111111;
        #100 write_enable = 4'b0;
        address = 16'b1000000000000000;
        #100
        $monitor(data_out);
        for(i=0; i<32767; i=i+1)
        begin
            #10 address = address + 1;
        end
        
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
//        #10 address = address + 1;
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
       
    block_ram ram(clk, reset, address, data_in, data_out, write_enable);   
    
endmodule
