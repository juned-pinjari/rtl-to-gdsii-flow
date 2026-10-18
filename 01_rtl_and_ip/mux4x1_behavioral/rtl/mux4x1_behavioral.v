module mux4x1_behavioral(
    input [3:0] d_in,
    input [1:0] sel,
    output reg out
);

    always @(*) begin
        case (sel)
            2'b00 : out = d_in[0];
            2'b01 : out = d_in[1];
            2'b10 : out = d_in[2];
            2'b11 : out = d_in[3];
            default: out = 1'bx;
        endcase
    end

endmodule
