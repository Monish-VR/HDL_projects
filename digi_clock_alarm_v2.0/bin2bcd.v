`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2025 21:46:26
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(input [5:0] in,output reg [2:0] tens, output reg [3:0] ones);

always@(*) begin
    tens <= in/10;
    ones <= in%10;
end
endmodule
