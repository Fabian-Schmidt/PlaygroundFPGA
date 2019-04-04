`timescale 100 ns / 10 ns

module myModule_tb();
    wire out;
    reg clock;

    always begin
	#1 clock =!clock;
    end

    initial begin
$dumpfile("myModule_tb.vcd");
$dumpvars(0,out,clock);

	//Initialize clock
	clock = 0;

	//End simulation
	#10
	$finish;

    end

    myModule notGate(clock, out);

endmodule
