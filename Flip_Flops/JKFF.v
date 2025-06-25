module JKFF(
    input clk, rst,
    input [4:0] j, k,
    output reg [4:0] q,
    output wire [4:0] qn
);
integer i;
reg [4:0] qnext;
assign qn = ~q;
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 5'b00000;
    else begin
        for (i = 0; i < 5; i = i + 1) begin
            case ({j[i], k[i]})
                2'b00: qnext[i] = q[i];
                2'b01: qnext[i] = 1'b0;
                2'b10: qnext[i] = 1'b1;
                2'b11: qnext[i] = ~q[i];
            endcase
        end
        q <= qnext;
    end
end
endmodule
