//`default_nettype none
//`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module top_tb ();
    reg clk = 0;
    wire ch_led;
    wire ch_usbpu;

    //-- Simulation time: (5000 * 100ns)
    parameter DURATION = 5000;

    //top #(.DUR(2))
    /*top mytop (
        .clk(clk),
        .ch_led(ch_led),
        .ch_usbpu(ch_usbpu)
      );*/

    //always #0.5 clk = ~clk;
    always begin
    	#1 clk =! clk;
    end

top mytop (clk, ch_led, ch_usbpu);

initial begin
  $dumpfile("top_tb.vcd");
  $dumpvars(0, mytop);

  #(DURATION) $display("End of simulation");
  $finish;
end



endmodule
