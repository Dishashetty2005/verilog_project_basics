module restaurant_order_tb;
reg clk;
reg reset;
reg place_order;
reg start_cooking;
reg food_ready;
reg serve_done;
wire [1:0] state_out;
restaurant_order uut(clk,reset,place_order,start_cooking,food_ready,serve_done,state_out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
#10; reset=1;place_order=0;start_cooking=0;food_ready=0;serve_done=0;
#10 reset=0;
#10;place_order=1;start_cooking=0;food_ready=0;serve_done=0;
#10;place_order=0;start_cooking=1;food_ready=0;serve_done=0;
#10;place_order=0;start_cooking=0;food_ready=1;serve_done=0;
#10;place_order=0;start_cooking=0;food_ready=0;serve_done=1;
#10;
$finish;
end
endmodule
