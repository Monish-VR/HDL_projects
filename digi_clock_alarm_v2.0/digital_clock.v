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

module digital_clock(input clk, rst, hr_inc, min_inc, output reg [5:0] min, sec, output reg [4:0] hr);
wire clkk;
//clock_div div(clk, clkk);
reg hr_inc_prev, min_inc_prev;
wire hr_inc_pulse = hr_inc & ~hr_inc_prev;
wire min_inc_pulse = min_inc & ~min_inc_prev;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        hr <= 0; 
        min <= 0; 
        sec <= 0;
        hr_inc_prev <= 0;
        min_inc_prev <= 0;
    end else begin
        hr_inc_prev <= hr_inc;
        min_inc_prev <= min_inc;
        
        if(min_inc_pulse) begin
            if(min == 59) begin
                min <= 0;
                if(hr == 23) hr <= 0; else hr <= hr + 1;
            end else min <= min + 1;
        end else if(hr_inc_pulse) begin
            if(hr == 23) hr <= 0; else hr <= hr + 1;
        end
        
        // Regular
        else if(sec == 59) begin
            sec <= 0;
            if (min == 59) begin
                min <= 0;
                if(hr == 23) hr <= 0; else hr <= hr + 1;
            end else min <= min + 1;
        end else sec <= sec + 1;
    end
end

endmodule 






