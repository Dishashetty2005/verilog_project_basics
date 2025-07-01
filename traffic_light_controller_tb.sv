`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 12:25:37
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb;
reg clk;
reg reset;
wire red;
wire yellow;
wire green;
traffic_light uut(clk,reset,red,yellow,green);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#20 reset=0;
#2000;
$finish;
end
endmodule
