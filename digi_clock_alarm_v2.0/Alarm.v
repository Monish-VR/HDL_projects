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


module digital_clock(input clk, rst, output reg [5:0] min, sec, output reg [4:0] hr);
//clock_div clock(.clk(clk), .clock(clkk));
always@(posedge clk or posedge rst) begin
    if(rst) begin
        hr <= 'b0; min <= 'b0; sec <= 'b0;
    end else begin
        if(sec == 'd59) begin
            sec <= 0;
            if (min == 'd59) begin
                min <= 0;
                if(hr == 'd23) hr <= 0; else hr <= hr + 1;
            end else min <= min + 1;
        end else sec <= sec + 1;
    end
end   
//initial begin
//alrm_on = 0;
//end
//always@(posedge clk) begin
//    if(hour == hr && minutes <= min)
//        alrm_on <= 1'b1;  else alrm_on <= 1'b0;       
//end
endmodule

///////////////////////////////////////////////////////

