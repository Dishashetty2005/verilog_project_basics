`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 11:18:26
// Design Name: 
// Module Name: four_bit_register_tb
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


module four_bit_register_tb;
reg clk;
reg reset;
reg [3:0]in;
wire [3:0]out;
four_bit_register uut(clk,reset,in,out);
always #10 clk=~clk;
initial begin
clk=0;reset=0;in=4'b0000;
#10;reset=0;in=4'b1010;
#10;reset=1;in=4'b1010;
#10;reset=0;in=4'b0101;
#20;
$finish;
end
endmodule
