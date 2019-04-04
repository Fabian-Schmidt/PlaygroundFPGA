// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input wire CLK,    // 16MHz clock
    output wire LED,   // User/boot LED next to power LED
    output wire USBPU  // USB pull-up resistor
);
    parameter DURATION = 28;

    wire CLK_NEW;
    wire locked;

    SB_PLL40_CORE #(
        .FEEDBACK_PATH("SIMPLE"),
        .DIVR(4'b0000),    // DIVR =  0
        .DIVF(7'b0110010), // frecuency multiplier = 50
        .DIVQ(3'b011),     // DIVQ =  3
        .FILTER_RANGE(3'b001) // FILTER_RANGE = 1
    ) uut (
        .LOCK(locked),
        .REFERENCECLK   (CLK),
        .PLLOUTGLOBAL   (CLK_NEW), // output frequency = 100MHz
        .BYPASS         (1'b0),
        .RESETB         (1'b1)
    );

    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // keep track of time
    reg [DURATION:0] blink_counter = 0;

    // increment the blink_counter every clock
    always @(posedge CLK_NEW) begin
        blink_counter <= blink_counter + 1;
    end

    // light up the LED
    assign LED = blink_counter[DURATION];
endmodule
