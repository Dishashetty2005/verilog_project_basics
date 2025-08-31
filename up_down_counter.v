module up_down_counter(
    input wire clk,
    input  wire rst_n,
    input wire up,
    input wire en,
    output reg [3:0] count,
    output reg min_max
    );
    always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
    count<=0;
    min_max<=0;
    end
    
    else if(en&&up) begin
      if(count==4'b1111)begin
      min_max<=1;
    count<=count;
    end
    else begin 
    count<=count+1;
    min_max<=0;
    end
    end
    
    else if(en&&!up)begin 
    if(count==4'b0000)begin
    min_max<=1;
    count<=count;
    end
    else begin
    count<=count-1;
    min_max<=0;
    end
    end
    
    else begin
    min_max<=0;
    end
    end
endmodule
