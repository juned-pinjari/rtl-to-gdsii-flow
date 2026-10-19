`timescale 1ns/1ps

module half_adder(
    input  a, 
    input  b,
    output sum, 
    output cout
);

    // ==========================================
    // Style 1: Gate-Level (Structural)
    // ==========================================
    xor u_xor (sum, a, b);
    and u_and (cout, a, b);

    // ==========================================
    // Style 2: Dataflow (Continuous Assignment)
    // ==========================================
    // assign sum  = a ^ b;
    // assign cout = a & b;
    // -- or arithmetic vector concatenation:
    // assign {cout, sum} = a + b;

    // ==========================================
    // Style 3: Behavioral (Procedural)
    // ==========================================
    // reg r_sum, r_cout;
    // always @(*) begin
    //     {r_cout, r_sum} = a + b;
    // end
    // assign sum  = r_sum;
    // assign cout = r_cout;

endmodule
