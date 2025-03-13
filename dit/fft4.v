
`timescale 1ns / 1ps

module fft4(  
    input wire[15:0] x0_re, x0_im, x1_re, x1_im, x2_re, x2_im, x3_re, x3_im,  
    output reg[15:0] y0_re, y0_im, y1_re, y1_im, y2_re, y2_im, y3_re, y3_im ,
    input wire clk,reset 
);  
    wire signed [15:0] s0_re, s0_im, s1_re, s1_im, s2_re, s2_im, s3_re, s3_im;
    wire signed [31:0] temp0_re, temp0_im, temp1_re, temp1_im;
    wire signed [15:0] t0_re, t0_im, t1_re, t1_im, t2_re, t2_im, t3_re, t3_im;

    // First stage butterfly calculations

    // Butterfly 0
    assign s0_re = x0_re + x2_re;
    assign s0_im = x0_im + x2_im;
    assign temp0_re = (x0_re - x2_re) * 16'h0001 - (x0_im - x2_im) * 16'h0000;
    assign temp0_im = (x0_re - x2_re) * 16'h0000 + (x0_im - x2_im) * 16'h0001;
    assign s1_re = temp0_re[15:0];
    assign s1_im = temp0_im[15:0];

    // Butterfly 1
    assign s2_re = x1_re + x3_re;
    assign s2_im = x1_im + x3_im;
    assign temp1_re = (x1_re - x3_re) * 16'h0000 - (x1_im - x3_im) * 16'hFFFF;
    assign temp1_im = (x1_re - x3_re) * 16'hFFFF + (x1_im - x3_im) * 16'h0000;
    assign s3_re = temp1_re[15:0];
    assign s3_im = temp1_im[15:0];

    // Second stage butterfly calculations

    // Butterfly 2 (y0 and y1)
   
    assign t0_re = s0_re - s2_re;
    assign t0_im = s0_im - s2_im;

  
    // Butterfly 3 (y2 and y3) with twiddle factor
    assign t1_re = s1_re + s3_re;
    assign t1_im = s1_im + s3_im;
    assign t2_re = s1_re - s3_re;
    assign t2_im = s1_im - s3_im;

    // Apply twiddle factor (complex multiplication by W_N for second stage)
    assign t3_re = t2_re;
    assign t3_im = t2_im;

    // Assign outputs for y2 and y3
   
    always@(posedge clk)begin
    if (reset)
    begin
    y0_re <=0;
    y0_im <=0;
    y1_re <=0;
    y1_im <=0;
    y2_re <=0;
    y2_im <=0;
    y3_re <=0;
    y3_im <=0;
    end
    else begin
     y0_re <= s0_re + s2_re;
     y0_im <= s0_im + s2_im;

     y1_re <= t0_re;
     y1_im <= t0_im;
     
     y2_re <= t1_re;
     y2_im <= t1_im;

     y3_re <= t3_re;
     y3_im <= t3_im;
    
    end
    end

endmodule
