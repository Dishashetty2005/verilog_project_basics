`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: DISHA SHETTY
// 
// Create Date: 24.06.2025 10:50:46
// Design Name: 
// Module Name: uart_tb
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


module uart_tb;
reg clk;
reg reset;
reg tx_start;
reg [7:0]data_in;
wire tx_done;
wire tx_serial;
uart uut(clk,reset,tx_start,data_in,tx_done,tx_serial);
 always #10 clk=~clk;
initial begin
clk=0;reset=1;tx_start=0;data_in=8'b00000000;
#10;reset=0;tx_start=1;data_in=8'b00000001;
#240;
$finish;
end
endmodule
