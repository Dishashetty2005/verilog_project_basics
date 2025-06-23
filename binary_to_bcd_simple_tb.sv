module binary_to_bcd_tb;
reg [3:0]in;
wire [4:0]out;
binary_to_bcd uut(in,out);
initial begin
in=4'b0000;
#10;in=4'b0110;
#10;in=4'b0011;
#10;in=4'b1010;
#10;in=4'b1011;
#10;in=4'b1111;
#10;
end
endmodule
