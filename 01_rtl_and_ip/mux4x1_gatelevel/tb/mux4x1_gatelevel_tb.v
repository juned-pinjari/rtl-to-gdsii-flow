`timescale 1ns/1ps

module mux4x1_gatelevel_tb;

    reg [3:0] d_in;
    reg [1:0] sel;
    wire out;

mux4x1_gatelevel uut(.d_in(d_in), .sel(sel), .out(out));

initial begin
    $dumpfile("mux4x1_gatelevel_dump.vcd");
    $dumpvars(0, mux4x1_gatelevel_tb);

    $display("GATE LEVEL MUX4X1 TEST");
    $display("SEL | IN    | OUT");
    $display("------------------");

    d_in = 4'b1101;

    sel = 2'b00; #10; $display("%b  | %b  | %b  ", sel, d_in, out);
    sel = 2'b01; #10; $display("%b  | %b  | %b  ", sel, d_in, out);
    sel = 2'b10; #10; $display("%b  | %b  | %b  ", sel, d_in, out);
    sel = 2'b11; #10; $display("%b  | %b  | %b  ", sel, d_in, out);
    
    $finish;

end

endmodule
