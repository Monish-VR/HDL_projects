`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2025 20:36:08
// Design Name: 
// Module Name: clock_div
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


module clock_div(input clk, output reg clock);
reg [20:0] counter = 0;
initial begin
clock = 0;
end
always@(posedge clk) begin
    if(counter == 49_000_000) begin
        counter <= 0;
        clock <= ~clock;
    end else  begin counter <= counter + 1; end
end
endmodule
