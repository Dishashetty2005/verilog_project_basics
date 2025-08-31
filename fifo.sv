module fifo (
    input  logic       clk,
    input  logic       reset,
    input  logic       wr_en,
    input  logic       rd_en,
    input  logic [7:0] din,
    output logic [7:0] dout,
    output logic       full,
    output logic       empty
);

    // Memory
    logic [7:0] mem [3:0];
    logic [1:0] wr_ptr, rd_ptr;
    logic [2:0] count; // range 0 to 4

    always_ff @(posedge clk) begin
        if (reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
            dout   <= 0;
        end else begin
            // Write
            if (wr_en && !full) begin
                mem[wr_ptr] <= din;
                wr_ptr      <= wr_ptr + 1;
                count       <= count + 1;
            end

            // Read
            if (rd_en && !empty) begin
                dout   <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                count  <= count - 1;
            end
        end
    end

    // Status flags
    assign full  = (count == 4);
    assign empty = (count == 0);

endmodule
