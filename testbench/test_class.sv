class FFT4Test;
    FFT4Env env;
    virtual FFT4If vif;
  
    function new(virtual FFT4If vif);
        this.vif = vif;
        env = new(vif);
    endfunction
  
    task basic_test;
        logic [15:0] expected_y0_re, expected_y0_im, expected_y1_re, expected_y1_im;
        logic [15:0] expected_y2_re, expected_y2_im, expected_y3_re, expected_y3_im;
        // Test Case 1
        env.driver.drive(16'd1, 16'd0, 16'd2, 16'd0, 16'd3, 16'd0, 16'd4, 16'd0);
        expected_y0_re = 16'd10; expected_y0_im = 16'd0;
        expected_y1_re = -16'd2; expected_y1_im = 16'd0;
        expected_y2_re = -16'd2; expected_y2_im = 16'd0;
        expected_y3_re = -16'd2; expected_y3_im = 16'd0;
        @(posedge vif.clk);
        env.scoreboard.check(expected_y0_re, expected_y0_im, expected_y1_re, expected_y1_im,
                              expected_y2_re, expected_y2_im, expected_y3_re, expected_y3_im);
    // Add more test cases with different inputs as required.
    endtask
    task run;
        env.run();
        basic_test();
    endtask
endclass 
