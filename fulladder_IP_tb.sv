`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 17:37:01
// Design Name: 
// Module Name: fulladder_tb
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


module fulladder_tb;
reg A;
reg B;
reg C_IN;
wire C_OUT;
wire S;
fulladder uut(A,B,C_IN,C_OUT,S);
initial begin
#10;A=0;B=0;C_IN=0;
#10;A=0;B=0;C_IN=1;
#10;A=0;B=1;C_IN=0;
#10;A=0;B=1;C_IN=1;
#10;A=1;B=0;C_IN=0;
#10;A=1;B=0;C_IN=1;
#10;A=1;B=1;C_IN=0;
#10;A=1;B=1;C_IN=1;
end
endmodul
