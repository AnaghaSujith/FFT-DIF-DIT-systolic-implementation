// Driver Class

class FFT4Driver;
  virtual FFT4If vif;  
  function new(virtual FFT4If vif);
    this.vif = vif;
  endfunction
  task drive(
    input [15:0] x0_re, x0_im, x1_re, x1_im,
    input [15:0] x2_re, x2_im, x3_re, x3_im
  );
    vif.x0_re <= x0_re;
    vif.x0_im <= x0_im;
    vif.x1_re <= x1_re;
    vif.x1_im <= x1_im;
    vif.x2_re <= x2_re;
    vif.x2_im <= x2_im;
    vif.x3_re <= x3_re;
    vif.x3_im <= x3_im;
    @(posedge vif.clk); // Wait for one clock cycle
  endtask
endclass 
