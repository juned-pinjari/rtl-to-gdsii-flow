module and_gate_tb;
	reg a,b;
	wire out;

and_gate uut(.a(a), .b(b), .out(out));

initial begin
$display (" time=%t a = %0b | b = %0b | out = %b", $time,a,b, out);
$monitor (" time=%t a = %0b | b = %0b | out = %b", $time,a,b, out);
#10;
	a = 1'b0; b = 1'b0; #10;
    a = 1'b0; b = 1'b1; #10;
    a = 1'b1; b = 1'b0; #10;
    a = 1'b1; b = 1'b1; #10;
	$finish;
	end

initial begin
	$dumpfile("and_gate_dump.vcd");
	$dumpvars();
end 
endmodule

