class FFT4Scoreboard;
  virtual FFT4If vif;
  function new(virtual FFT4If vif);
    this.vif = vif;
  endfunction
  task check(
    input [15:0] expected_y0_re, expected_y0_im, expected_y1_re, expected_y1_im,
    input [15:0] expected_y2_re, expected_y2_im, expected_y3_re, expected_y3_im
  );
      if (vif.y0_re !== expected_y0_re || vif.y0_im !== expected_y0_im ||
        vif.y1_re !== expected_y1_re || vif.y1_im !== expected_y1_im ||
        vif.y2_re !== expected_y2_re || vif.y2_im !== expected_y2_im ||
        vif.y3_re !== expected_y3_re || vif.y3_im !== expected_y3_im) begin
        $display("Mismatch: Expected and Actual FFT outputs do not match.");
      end else begin
        $display("Pass: FFT outputs are correct.");
      end
  endtask
endclass 
