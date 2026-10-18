module and_gate_tb;
	reg a, b;
	wire out;

	and_gate uut(.a(a), .b(b), .out(out));

	integer errors = 0;

	task check(input in_a, input in_b, input expected);
	begin
		a = in_a;
		b = in_b;
		#10;
		$display("time=%0t | a=%b b=%b | out=%b (expected %b)", $time, a, b, out, expected);
		if (out !== expected) begin
			$error("MISMATCH at time %0t: a=%b b=%b | got %b, expected %b", 
			       $time, a, b, out, expected);
			errors = errors + 1;
		end
	end
	endtask

	initial begin
		$display("=== AND GATE SELF-CHECKING TEST ===");
		check(0, 0, 0);
		check(0, 1, 0);
		check(1, 0, 0);
		check(1, 1, 1);

		if (errors == 0)
			$display("--> ALL TESTS PASSED");
		else
			$display("--> TEST FAILED with %0d error(s)", errors);

		$finish;
	end

	initial begin
		$dumpfile("and_gate_dump.vcd");
		$dumpvars();
	end
endmodule

