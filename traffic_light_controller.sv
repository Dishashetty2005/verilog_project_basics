
module traffic_light(
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
    );
    parameter RED=2'b00,YELLOW1=2'b01,GREEN=2'b10,YELLOW2=2'b11;
    reg[1:0] pr_state,next_state;
    reg [31:0]counter;
    parameter RED_TIME=50,YELLOW_TIME=10,GREEN_TIME=50;
    
    always@(posedge clk)
    begin
    if(reset)begin
    pr_state<=RED;
    counter<=0;
    end
    else begin
    if(counter==((pr_state==RED)?RED_TIME:(pr_state==GREEN)?GREEN_TIME:YELLOW_TIME))begin
    pr_state<=next_state;
    counter<=0;
    end
    else begin
    counter<=counter+1;
    end
    end
    end
    
    
    always@(pr_state)begin
    case(pr_state)
    RED:next_state=YELLOW1;
    YELLOW1:next_state=GREEN;
    GREEN:next_state=YELLOW2;
    YELLOW2:next_state=RED;
    default:next_state=RED;
    endcase
    end
    
    always@(pr_state)begin
    red=0;
    yellow=0;
    green=0;
    case(pr_state)
    RED:red=1;
    YELLOW1:yellow=1;
    GREEN:green=1;
    YELLOW2:yellow=1;
    endcase
    end
endmodule
