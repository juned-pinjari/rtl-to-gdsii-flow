`timescale 1ns/1ps

module mux4x1_dataflow(
    input [3:0] d_in,
    input [1:0] sel,
    output out
);

//  assign out = d_in[sel];

    assign out = ( ~sel[0] &  ~sel[1] & d_in[0] |
                    sel[0] &  ~sel[1] & d_in[1] |
                   ~sel[0] &   sel[1] & d_in[2] |
                    sel[0] &   sel[1] & d_in[3] 
                );
endmodule
