`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 09:01:40
// Design Name: 
// Module Name: digitalclock
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


module digitalclock(
    input clk,rst,
    output [3:0] sec_ones, sec_tens, min_ones, min_tens, hr_ones, hr_tens
    );
    
//reg [3:0] seconds, minutes, hours;

reg [5:0] sec_counter, min_counter;
reg [4:0] hr_counter;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		sec_counter <= 0;
	end else begin
	   if(sec_counter == 59)
		  sec_counter <=0;
	   else
		sec_counter <= sec_counter + 1;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		min_counter <= 0;
	end else begin
		if(sec_counter == 59) begin
			if(min_counter == 59) 
				min_counter <=0;
			else
				min_counter <= min_counter + 1;
		end	
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		hr_counter <= 0;
	end else begin
		if(sec_counter == 59 && min_counter == 59) begin
			if(hr_counter == 23) 
				hr_counter <=0;
			else
				hr_counter <= hr_counter + 1;
		end	
	end
end

//always@(posedge clk) begin
//	seconds <= sec_counter;
//	minutes <= min_counter;
//	hours <= hr_counter;
//end

assign hr_ones = hr_counter%10;
assign hr_tens = hr_counter/10;
assign min_ones = sec_counter%10;
assign min_tens = sec_counter/10;
assign sec_ones = sec_counter%10;
assign sec_tens = sec_counter/10;

endmodule
