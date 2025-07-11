module introvert_help_tb;
reg clk;
reg reset;
reg unknown_people;
reg comfort_zone;
reg known_people;
wire [1:0] out;
introvert_help uut(clk,reset,unknown_people,comfort_zone,known_people,out);
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
#20;reset=1;unknown_people=0;comfort_zone=0;known_people=0;
#20;reset=0;unknown_people=0;comfort_zone=1;known_people=0;
#20;reset=0;unknown_people=0;comfort_zone=1;known_people=1;
#20;reset=0;unknown_people=1;comfort_zone=1;known_people=0;
#20;
$finish;
end
endmodule
