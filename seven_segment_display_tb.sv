`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 10:11:44
// Design Name: 
// Module Name: sevem_segment_display_tb
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


module seven_segment_display_tb;
reg [3:0]in;
wire [6:0]out;
seven_segment_display uut(in,out);
initial begin
#10;in=4'b0000;
#10;in=4'b0001;
#10;in=4'b0010;
#10;in=4'b0011;
#10;in=4'b0100;
#10;in=4'b0101;
#10;in=4'b0110;
#10;in=4'b0111;
#10;in=4'b1000;
#10;in=4'b1001;
#10;
$finish;
end
endmodule
