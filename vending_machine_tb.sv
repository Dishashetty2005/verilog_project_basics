module vending_machine_tb;
    reg in;
    reg clk;
    reg reset;
    wire [1:0] choco;

    vending_machine uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .choco(choco)
    );

    // Generate clock with 20 ns period
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        // Initialize inputs
        in = 0;
        reset = 1;

        // Apply reset
        #20 reset = 0;

        // Test 1: Insert ₹1, then no coin → Expect 1 rupee chocolate
        #20 in = 1;
        #20 in = 0;
        #20;

        // Test 2: Insert ₹1 → ₹2 → no coin → Expect 2 rupee chocolate
        #20 in = 1;
        #20 in = 1;
        #20 in = 0;
        #20;

        // Test 3: Insert ₹1 → ₹2 → ₹3 → Expect 3 rupee chocolate
        #20 in = 1;
        #20 in = 1;
        #20 in = 1;
        #40;

        $finish;
    end
endmodule
