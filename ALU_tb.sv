`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 08:06:59
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
reg [3:0] A;
reg [3:0] B;
reg [3:0]op;
wire [4:0] result;
ALU uut(A,B,op,result);
initial begin
#10;A=4'b0000;B=4'b0001;op=4'b0000;
#10;A=4'b0010;B=4'b0010;op=4'b0001;
#10;A=4'b0100;B=4'b0101;op=4'b0010;
#10;A=4'b0011;B=4'b0000;op=4'b0011;
#10;A=4'b1001;B=4'b0011;op=4'b0100;
#10;A=4'b0100;B=4'b0011;op=4'b0101;
#10;A=4'b1001;B=4'b0011;op=4'b0110;
#10;A=4'b1001;B=4'b0011;op=4'b0111;
#10;A=4'b1001;B=4'b1011;op=4'b1000;
#10;A=4'b1001;B=4'b1011;op=4'b1001;
#10;A=4'b1001;B=4'b1011;op=4'b1010;
#10;A=4'b1001;B=4'b1011;op=4'b1011;
#10;A=4'b1001;B=4'b1011;op=4'b1100;
#10;A=4'b1001;B=4'b1011;op=4'b1101;
#10;A=4'b1001;B=4'b1011;op=4'b1110;
#10;A=4'b1001;B=4'b1011;op=4'b1111;
#10;
$finish;
end
endmodule
