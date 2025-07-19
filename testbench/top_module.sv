module top;
  FFT4If vif();
  // Clock generation
  always #5 vif.clk = ~vif.clk;
  // DUT Instance
  fft4 DUT (
      .x0_re(vif.x0_re), .x0_im(vif.x0_im),
      .x1_re(vif.x1_re), .x1_im(vif.x1_im),
      .x2_re(vif.x2_re), .x2_im(vif.x2_im),
      .x3_re(vif.x3_re), .x3_im(vif.x3_im),
      .y0_re(vif.y0_re), .y0_im(vif.y0_im),
      .y1_re(vif.y1_re), .y1_im(vif.y1_im),
      .y2_re(vif.y2_re), .y2_im(vif.y2_im),
      .y3_re(vif.y3_re), .y3_im(vif.y3_im)
  );
  FFT4Test test;
  initial begin
      test = new(vif);
      test.run();
  end
  initial begin
      $dumpfile("waveform.vcd"); // Name of the waveform file
      $dumpvars(0, top); // Dump all signals in the module hierarchy
  end
  initial begin
      #100; // Let the simulation run for 100 time units
      $finish; // End the simulation
  end 
endmodule
