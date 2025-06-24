module vending_machine(
    input in,
    input clk,
    input reset,
    output reg [1:0] choco
    );
    reg [2:0]pr_state,nxt_state;
    parameter idle=3'b000,one_rupee=3'b001,one_dispense=3'b010,two_rupee=3'b011,two_dispense=3'b100,three_dispense=3'b101;
    always@(posedge clk , posedge reset)begin
    if(reset)
    pr_state<=idle;
    else
    pr_state<=nxt_state;
    end
    always@(in,pr_state)begin
    case(pr_state)
    idle:if(in)nxt_state=one_rupee;
         else nxt_state=idle;
    one_rupee:if(in)nxt_state=two_rupee;
              else nxt_state=one_dispense;
    two_rupee:if(in)nxt_state=three_dispense;
              else nxt_state=two_dispense;
     default:nxt_state=idle;
     endcase
     end
     always@(pr_state)begin
     case(pr_state)
     idle:choco=2'b00;       //2'b00=no choco
     one_rupee:choco=2'b00;
     one_dispense:choco=2'b01;   //2'b01=one rupee chcoc
     two_rupee:choco=2'b00;
     two_dispense:choco=2'b10;    //2'b10=two rupee choco
     three_dispense:choco=2'b11;       //2'b11=2'b11   three rupee choco
     endcase
     end
     endmodule
