`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2025 22:01:45
// Design Name: 
// Module Name: debouncee
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

module debouncee(
    input clk,
    input btn_in,
    output btn_out
    );
    
    reg temp1, temp2, temp3;
    
    always @(posedge clk) begin
        temp1 <= btn_in;
        temp2 <= temp1;
        temp3 <= temp2;
    end
    
    assign btn_out = temp3;
    
endmodule
