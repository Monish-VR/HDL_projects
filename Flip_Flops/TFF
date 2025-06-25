module TFF(
    input clk, rst,
    input [4:0] t,
    output reg [4:0] q,
    output wire [4:0] qn
);

// Continuous assignment for qn
assign qn = ~q;

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 5'b00000;
    else
        q <= q ^ t;
end

endmodule
