module DFF (input clk, rst, en, input [4:0] d, output reg [4:0] q, qn);
always@(posedge clk or posedge rst) begin
    if(rst) begin 
        q <= 'b0;
        qn <= 5'b11111;
    end else if(en) begin q <= d; qn <= ~d; end
    else begin q <= q; qn <= ~ q; end
end 
endmodule
