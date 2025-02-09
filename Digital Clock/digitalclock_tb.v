`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 09:05:16
// Design Name: 
// Module Name: digitalclock_tb
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


module digitalclock_tb(

    );
    
reg clk;
reg rst;
wire [3:0] sec_ones, sec_tens, min_ones, min_tens, hr_ones, hr_tens;
digitalclock dut(
	.clk(clk),
	.rst(rst),
	.sec_ones(sec_ones),
	.sec_tens(sec_tens),
	.min_ones(min_ones),
	.min_tens(min_tens),
	.hr_ones(hr_ones),
	.hr_tens(hr_tens)
);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end
initial begin
	rst = 1; #10;
	rst = 0; #1000;
	$finish;
end
always@(posedge clk) begin
	$display("$Time: %d%d:%d%d:%d%d", hr_tens, hr_ones, min_tens, min_ones, sec_tens, sec_ones);
end
endmodule
