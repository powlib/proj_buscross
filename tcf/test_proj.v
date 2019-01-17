module test_proj();

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(10, top_inst);
  end

  localparam LEDW = 16;
  wire [LEDW-1:0] leds;

  proj_top top_inst (.sys_clock(sys_clock),.reset(reset),.GPIO_0_tri_io(leds));

endmodule