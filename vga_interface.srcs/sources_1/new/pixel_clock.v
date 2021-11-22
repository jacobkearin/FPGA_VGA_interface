`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 01:48:10 PM
// Design Name: 
// Module Name: pixel_clock
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


module pixel_clock(clk, pixel_clock);
input clk;
output pixel_clock = 1;
reg pixel_clock;
reg counter = 0;
always @(posedge clk) begin
    counter <= counter + 1;
    if (counter == 0) pixel_clock = !pixel_clock;
end
endmodule


module pixel_clock_tb;  //test bench for clock 25Mhz clock
reg clock = 0;
wire output25mhz;
always begin
    clock = !clock;
    #5;
end
pixel_clock dut (clock, output25mhz);
endmodule
