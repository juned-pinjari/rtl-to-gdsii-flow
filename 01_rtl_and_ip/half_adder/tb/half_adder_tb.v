`timescale 1ns/1ps

module half_adder_tb;

    reg a, b;
    wire sum, cout;

    half_adder uut (.a(a), .b(b), .sum(sum), .cout(cout));

    integer errors = 0;

    task check(input t_a, input t_b, input t_sum, input t_cout);
    begin
        a = t_a;
        b = t_b;
        #10;
        $display(" %0t |  %b  |  %b  |  %b  |   %b   | expected sum=%b, expected cout=%b", $time, a, b, sum, cout, t_sum, t_cout);
        if (sum !== t_sum || cout !== t_cout) begin
            $error("MISMATCH at %0t: a=%b | b=%b , got sum=%b | cout=%b, expected sum=%b | cout=%b", $time, a, b, sum, cout, t_sum, t_cout);
            errors = errors + 1;
        end
    
    end
    endtask

    initial begin
        $dumpfile("half_adder_dump.vcd");
        $dumpvars(0, half_adder_tb);

        $display("==== HALF ADDER SELF-CHECKING TEST ====");
        $display("  TIME |  a  |  b  | sum | cout  |");

        check(1'b0, 1'b0, 1'b0, 1'b0);
        check(1'b0, 1'b1, 1'b1, 1'b0);
        check(1'b1, 1'b0, 1'b1, 1'b0);
        check(1'b1, 1'b1, 1'b0, 1'b1);

        if (errors == 0)
            $display("---> ALL TESTS PASSED");
        else
            $display("---> TEST FAILED with %0d error(s)", errors);

        $finish;
    end

endmodule
