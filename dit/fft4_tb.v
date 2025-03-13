module fft4_tb;  

    reg clk, reset;
    reg [15:0] x0_re, x0_im, x1_re, x1_im, x2_re, x2_im, x3_re, x3_im;  
    wire [15:0] y0_re, y0_im, y1_re, y1_im, y2_re, y2_im, y3_re, y3_im;  

    // Instantiate the FFT module  
    fft4 uut (
        .clk(clk), .reset(reset),
        .x0_re(x0_re), .x0_im(x0_im),  
        .x1_re(x1_re), .x1_im(x1_im),  
        .x2_re(x2_re), .x2_im(x2_im),  
        .x3_re(x3_re), .x3_im(x3_im),
        .y0_re(y0_re), .y0_im(y0_im),  
        .y1_re(y1_re), .y1_im(y1_im),
        .y2_re(y2_re), .y2_im(y2_im),  
        .y3_re(y3_re), .y3_im(y3_im)
    );  

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #15 reset = 0;
         
        // Case 1: Simple Real Inputs
        x0_re = 16'h0001; x0_im = 16'h0000;  
        x1_re = 16'h0002; x1_im = 16'h0000;  
        x2_re = 16'h0003; x2_im = 16'h0000;  
        x3_re = 16'h0004; x3_im = 16'h0000;  
        #100;
       
        // Case 2: Edge values close to overflow
        x0_re = 16'h7FFF; x0_im = 16'h7FFF;
        x1_re = 16'h8000; x1_im = 16'h8000;
        x2_re = 16'h7FFF; x2_im = 16'h8000;
        x3_re = 16'h8000; x3_im = 16'h7FFF;
        #100;

        // Case 3: Mixed positive and negative complex values
        x0_re = 16'h0002; x0_im = 16'h0000;  
        x1_re = 16'hFFFF; x1_im = 16'h0002;
        x2_re = 16'h0000; x2_im = 16'h0000;
        x3_re = 16'h0003; x3_im = 16'hFFFF;
        #100;

        // Case 4: Complex-only imaginary values
        x0_re = 16'h0000; x0_im = 16'h0001;
        x1_re = 16'h0000; x1_im = 16'h0002;
        x2_re = 16'h0000; x2_im = 16'h0003;
        x3_re = 16'h0000; x3_im = 16'h0004;
        #100;

        // Case 5: Random complex values
        x0_re = 16'h1234; x0_im = 16'h5678;
        x1_re = 16'h9ABC; x1_im = 16'hDEF0;
        x2_re = 16'h0F0F; x2_im = 16'hF0F0;
        x3_re = 16'hAAAA; x3_im = 16'h5555;
        #100;
       
        // Display Results for Verification
        $display("y0 = %d + %di", $signed(y0_re), $signed(y0_im));  
        $display("y1 = %d + %di", $signed(y1_re), $signed(y1_im));  
        $display("y2 = %d + %di", $signed(y2_re), $signed(y2_im));  
        $display("y3 = %d + %di", $signed(y3_re), $signed(y3_im));

        // Finish simulation
        #50;
        $finish;
    end  
endmodule
	

