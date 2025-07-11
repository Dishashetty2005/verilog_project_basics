`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 12:20:52
// Design Name: 
// Module Name: mood_light
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


module mood_ligh_tb;
reg [1:0]in;
reg reset;
reg clk;
wire [1:0] response;
mood_light uut(in,reset,clk,response);
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
#20;reset=0;in=2'b00;
#20;reset=0;in=2'b10;
#20;reset=0;in=2'b01;
#20;reset=0;in=2'b11;
#20;
$finish;
end
endmodule
