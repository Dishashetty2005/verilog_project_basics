`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 10:59:40
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;
reg [2:0]in;
wire [7:0]out;
decoder uut(in,out);
initial begin
#10;in= 3'b000;
#10; in=3'b001;
#10; in=3'b010;
#10; in=3'b011;
#10; in=3'b100;
#10; in=3'b101;
#10; in=3'b110;
#10; in=3'b111;
end
endmodule
