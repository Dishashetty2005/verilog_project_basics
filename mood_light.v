
module mood_light(
    input [1:0] in,
    input reset,
    input clk,
    output reg [1:0] response
    );
    always@(posedge clk or posedge reset)begin
    if(reset)
    response<=2'b00; //yay
    else begin
    case(in)
    2'b00:response<=2'b00; //happy->yay
    2'b01:response<=2'b01;//clam->peace
    2'b10:response<=2'b10;//energitic->hooray
    2'b11:response<=2'b11;//sleepy->good night
    endcase
    end
    end
endmodule
