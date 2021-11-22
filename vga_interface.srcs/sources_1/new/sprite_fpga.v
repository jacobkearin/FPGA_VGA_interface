`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 02:27:21 PM
// Design Name: 
// Module Name: sprite_fpga
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


module sprite_fpga(clk, Hsync, Vsync, vgaRed, vgaBlue, vgaGreen);
input clk;
output Hsync, Vsync;
output [3:0] vgaRed, vgaBlue, vgaGreen;
wire clk25, data_enable;
wire [12:0] vcount, hcount;
parameter sprite_h_loc = 0;
parameter sprite_v_loc = 0;
parameter sprite_height = 10;
parameter sprite_length = 10;

pixel_clock(clk, clk25);
enhanced_sync_signals (clk25, Vsync, Hsync, data_enable, vcount, hcount);

//considering options for methods of delivering a moveable, modular sprite on the screen

//option a
//some module for sprite
//      inputs = paramters in this module for sprite location
//      inputs = parameters in this module for background color?
//      inputs = hcount, vcount
//      outputs = rgb values
//this would only allow for one sprite - needs tweaks


//option b
//if ((hcount == sprite_h_loc:sprite_h_loc + sprite length) && 
//      (vcount == sprite_v_loc:sprite_v_loc + sprite_height))
//          some_new_specific_sprite_module()
//                  inputs - vcount, hcount
//                  outputs - vgared, vgablue, vgagreen
//else set colors

endmodule
