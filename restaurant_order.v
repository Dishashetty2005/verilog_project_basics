module restaurant_order(
    input clk,
    input reset,
    input place_order,
    input start_cooking,
    input food_ready,
    input serve_done,
    output reg [1:0] state_out
    );
    parameter idle=2'b00,order_placed=2'b01,preparing=2'b10,ready=2'b11;
    reg [1:0] pr_state,nxt_state;
    always@(posedge clk)begin
    if(reset)
    pr_state<=idle;
    else
    pr_state<=nxt_state;
    end
    always@(*)begin
    case(pr_state)
    idle:begin
    if(place_order) nxt_state=order_placed;
    else nxt_state=idle;
    end
    order_placed:begin
    if(start_cooking) nxt_state=preparing;
    else nxt_state=order_placed;
    end
    preparing:begin
    if(food_ready) nxt_state=ready;
    else nxt_state=preparing;
    end
    ready:begin
    if(serve_done) nxt_state=idle;
    else nxt_state=ready;
    end
    default:nxt_state=idle;
     endcase
     end
     always@(pr_state)begin
     case(pr_state)
     idle:state_out=2'b00;
     order_placed:state_out=2'b01;
     preparing:state_out=2'b10;
     ready:state_out=2'b11;
     endcase
     end
endmodule
