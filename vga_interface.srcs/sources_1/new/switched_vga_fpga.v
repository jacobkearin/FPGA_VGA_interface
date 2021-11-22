`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 01:52:02 PM
// Design Name: 
// Module Name: switched_vga_fpga
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

//working version of the vga interface with built-in switches as the 4 bit rgb values

module switched_vga_fpga(clk, Hsync, Vsync, sw, vgaRed, vgaBlue, vgaGreen);
input clk;
input [15:0] sw;
output Hsync, Vsync;
output [3:0] vgaRed, vgaBlue, vgaGreen;
wire clk25, data_enable;

pixel_clock(clk, clk25);
sync_signals(clk25, Vsync, Hsync, data_enable);

assign vgaRed = !data_enable ? sw[3:0] : 0;
assign vgaBlue = !data_enable ? sw[7:4] : 0;
assign vgaGreen = !data_enable ? sw[11:8] : 0;

endmodule