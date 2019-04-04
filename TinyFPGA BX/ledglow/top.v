// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input wire CLK,    // 16MHz clock
    output wire LED,   // User/boot LED next to power LED
    output wire USBPU  // USB pull-up resistor
);
    parameter DURATION = 24;//7
    parameter PWM_LENGTH = 4;

    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // keep track of time
    reg [DURATION:0] blink_counter = 0;

    // increment the blink_counter every clock
    always @(posedge CLK) begin
        blink_counter <= blink_counter + 1;
    end

    wire [PWM_LENGTH:0] PWM_input = blink_counter[DURATION] ? blink_counter[DURATION - 1:DURATION - 1 - PWM_LENGTH] : ~blink_counter[DURATION - 1:DURATION - 1 - PWM_LENGTH];

    reg [PWM_LENGTH + 1:0] PWM = 0;
    always @(posedge CLK) begin
      PWM <= PWM[PWM_LENGTH:0]+PWM_input;
    end

    // light up the LED according to the pattern
    //assign LED = blink_counter[DURATION];
    assign LED = PWM[PWM_LENGTH + 1];
endmodule
