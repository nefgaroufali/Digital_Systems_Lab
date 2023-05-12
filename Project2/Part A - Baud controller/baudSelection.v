`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 23:13:59
// Design Name: 
// Module Name: baudSelection
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


module baudSelection(baud_select, max_value);
    
    input [2:0] baud_select;
    output [15:0] max_value;
    reg [15:0] max_value;
    
    always@(baud_select)
    begin
        case(baud_select)
            0: max_value = 16'b0101000101100001;
            1: max_value = 16'b0001010001011000;
            2: max_value = 16'b0000010100010110;
            3: max_value = 16'b0000001010001011;
            4: max_value = 16'b0000000101000101;
            5: max_value = 16'b0000000010100010;
            6: max_value = 16'b0000000001101100;
            7: max_value = 16'b0000000000110110;
        endcase
    end

endmodule
