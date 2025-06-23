
module binary_to_bcd(
    input [3:0] in,
    output reg [4:0] out
    );
    always@(*)begin
    if(in>4'b1001)
    out={1'b1,in-4'b1010};
    else
    out={1'b0,in};
    end
endmodule
