`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2025 10:22:14
// Design Name: 
// Module Name: top
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


module top(input clk, rst, inc_hr, inc_min, alm_hr, alm_min, output reg alrm_on);

wire hr_out, min_out;
wire [5:0] min, sec;
wire [4:0] hr;
wire [2:0] hr_tens;
wire [3:0] hr_ones;
wire [2:0] min_tens;
wire [3:0] min_ones;
wire [0:6] seg;
wire [3:0] an;
debouncee hrr(.clk(clk), .btn_in(inc_hr), .btn_out(hr_out));
debouncee minn(.clk(clk), .btn_in(inc_min), .btn_out(min_out));

digital_clock clock(clk, rst, hr_out, min_out, min, sec,hr);

// seven segment display
bin2bcd hr_bcd({1'b0, hr},hr_tens, hr_ones);
bin2bcd min_bcd( min ,min_tens, min_ones);
seg7_control display( clk, rst, hr_tens, hr_ones, min_tens, min_ones, seg,an);

initial begin
alrm_on = 0;
end
always@(posedge clk) begin
    if(hr == alm_hr && min == alm_min)
        alrm_on <= 1'b1;  else alrm_on <= 1'b0;       
end
endmodule
