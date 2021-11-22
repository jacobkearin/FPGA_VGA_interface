`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 01:50:04 PM
// Design Name: 
// Module Name: vga_fpga
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

//working version of vga interface for a single color on screen.

module vga_fpga(clk, Hsync, Vsync, vgaRed, vgaBlue, vgaGreen);
input clk;
output Hsync, Vsync;
output [3:0] vgaRed, vgaBlue, vgaGreen;
wire clk25;
wire data_enable;

pixel_clock(clk, clk25);
sync_signals(clk25, Vsync, Hsync, data_enable);

assign vgaRed = !data_enable ? 15 : 0;  //15, 14, 4 for a pinkish color
assign vgaBlue = !data_enable ? 14 : 0; //adjust as desired
assign vgaGreen = !data_enable ? 4 : 0;

endmodule