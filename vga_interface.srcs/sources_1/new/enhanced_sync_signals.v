`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 01:56:10 PM
// Design Name: 
// Module Name: enhanced_sync_signals
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


module enhanced_sync_signals (clk, vsync, hsync, data_enable, vcount, hcount);
input clk;
output data_enable;
output vsync;
output hsync;
output [12:0] vcount;
output [12:0] hcount;

parameter VFP = 8000;   //vertical front porch
parameter VBP = 23200;  //vertical back porch
parameter VPW = 1600;   //vertical pulse width
parameter VDT = 384000; //vertical display time
parameter VS = VFP + VBP + VPW + VDT;
parameter VC = 480;
parameter HFP = 16;     //horizontal front porch
parameter HBP = 48;     //horizontal back porch
parameter HPW = 96;     //horizontal pulse width
parameter HDT = 640;    //horizontal display time
parameter HS = HFP + HBP + HPW + HDT;
parameter HC = 640;

reg [19:0] vcounter = 0;
reg vfp = 0;
reg vbp = 0;
reg vpw = 0;
reg vdt = 1;
reg [12:0] hcounter = 0;
reg hfp = 0;
reg hbp = 0;
reg hpw = 0;
reg hdt = 1;
reg [12:0] vcount = 0;
reg [12:0] hcount = 0;

assign data_enable = !(vdt && hdt);
assign vsync = !vpw;
assign hsync = !hpw;
//assign vcount = vcountr;
//assign hcount = hcountr;

always @(posedge clk) begin
    vcounter <= vcounter +1;
    if (vcounter == (VDT - 1)) begin
        vdt <= 0;
        vfp <= 1;
    end if (vcounter == (VDT + VFP - 1)) begin
        vfp <= 0;
        vpw <= 1;
    end if (vcounter == (VDT + VFP + VPW - 1)) begin
        vpw <= 0;
        vbp <= 1;
    end if (vcounter == (VS - 1)) begin
        vcounter <= 0;
        vbp <= 0;
        vdt <= 1;
    end
    
    hcounter <= hcounter +1;
    if (hcounter == (HDT - 1)) begin
        hdt <= 0;
        hfp <= 1;
    end if (hcounter == (HDT + HFP - 1)) begin
        hfp <= 0;
        hpw <= 1;
    end if (hcounter == (HDT + HFP + HPW - 1)) begin
        hpw <= 0;
        hbp <= 1;
    end if (hcounter == (HS - 1)) begin
        hcounter <= 0;
        hbp <= 0;
        hdt <= 1;
    end
end

always @(posedge clk) begin
    if (!data_enable) hcount <= hcount + 1;
    if (hcount == (HC - 1)) hcount <= 0;
end

always @(posedge data_enable) begin
    vcount <= vcount + 1;
    if (vcount == (VC - 1)) vcount <= 0;
end
endmodule


module enhanced_sync_output_tb;
reg clk = 0;
wire vsync, hsync, data_enable;
wire [12:0] vcount, hcount;
always begin
    #20;
    clk = !clk;
    
end
enhanced_sync_signals dut(clk, vsync, hsync, data_enable, vcount, hcount);
endmodule
