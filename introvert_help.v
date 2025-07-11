
module introvert_help(
    input clk,
    input reset,
    input unknown_people,
    input comfort_zone,
    input known_people,
    output reg[1:0] out
    );
    parameter happy=2'b00,awkward=2'b01,very_happy=2'b10;
    reg [1:0]pr_state,next_state;
    always@(posedge clk)begin
    if(reset)
    pr_state<=awkward;
    else
    pr_state<=next_state;
    end
    always@(unknown_people,comfort_zone,known_people,pr_state)begin
    case(pr_state)
    happy:begin
    if(known_people) next_state=happy;
          else if(unknown_people) next_state=awkward;
          else if(comfort_zone) next_state=very_happy;
          end
    awkward:begin
    if(unknown_people) next_state=awkward;
            else if(comfort_zone) next_state=very_happy;
            else if(known_people) next_state=happy;
            end
    very_happy:begin
    if(comfort_zone) next_state=very_happy;
               else if(known_people) next_state=happy;
               else if(unknown_people) next_state=awkward;
               end
   default:next_state=awkward;
              endcase
              end
              always@(pr_state)begin
              case(pr_state)
              happy:out=2'b00;
              awkward:out=2'b01;
              very_happy:out=2'b10;
              default:out=2'b00;
              endcase 
              end
endmodule
