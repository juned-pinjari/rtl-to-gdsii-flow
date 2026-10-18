`timescale 1ns/1ps

module mux4x1_dataflow_tb;
    reg [3:0] d_in;
    reg [1:0] sel;
    wire out;

    mux4x1_dataflow uut(.d_in(d_in), .sel(sel), .out(out));

    integer errors = 0;

    task check(input [3:0] t_d_in, input [1:0] t_sel, input t_expected);
    begin
        d_in = t_d_in;
        sel = t_sel;
        #10;
        $display("TIME=%0t | SEL=%b | IN=%b   | OUT=%b (expected %b)",$time, sel, d_in, out, t_expected);
        if (out !== t_expected) begin
            $error("MISMATCH at time %0t: SEL=%b IN=%b | got %b, expected %b", $time, sel, d_in, out, t_expected);
            errors = errors + 1;
        end
    end
    endtask

    initial begin
        $dumpfile("mux4x1_dataflow_dump.vcd");
        $dumpvars(0, mux4x1_dataflow_tb);

        $display("==== DATAFLOW MODELLING MUX4X1 SELF-CHECKING TEST ====");
        $display("------------------------------------------------------");

        check(4'b1101, 2'b00, 1'b1);
        check(4'b1101, 2'b01, 1'b0);
        check(4'b1101, 2'b10, 1'b1);
        check(4'b1101, 2'b11, 1'b1);

        if (errors == 0)
            $display("---> ALL TESTS PASSED");
        else
            $display("---> TEST FAILED with %d error(s)", errors);
        
        $finish;

    end

endmodule
