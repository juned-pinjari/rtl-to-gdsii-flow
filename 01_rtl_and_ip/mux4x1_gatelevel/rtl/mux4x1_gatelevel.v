`timescale 1ns/1ps

module mux4x1_gatelevel(

    input [3:0] d_in,
    input [1:0] sel,
    output out
);

    wire s0_not, s1_not;
    wire and0, and1, and2, and3;

    not (s0_not, sel[0]);
    not (s1_not, sel[1]);

    and (and0, s0_not, s1_not, d_in[0]);
    and (and1, sel[0], s1_not, d_in[1]);
    and (and2, s0_not, sel[1], d_in[2]);
    and (and3, sel[0], sel[1], d_in[3]);

    or (out, and0, and1, and2, and3);

endmodule
