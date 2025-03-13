`timescale 1ns / 1ps
module DIF_FFT_4_point (

      input wire signed [15:0] x0_re, x0_im,

      input wire signed [15:0] x1_re, x1_im,

      input wire signed [15:0] x2_re, x2_im,

      input wire signed [15:0] x3_re, x3_im,

      output reg signed [15:0] y0_re, y0_im,

      output reg signed [15:0] y1_re, y1_im,

      output reg signed [15:0] y2_re, y2_im,

      output reg signed [15:0] y3_re, y3_im,
      input wire clk, reset

  );

 
      // Temporary variables for intermediate stages

      wire signed [15:0] a0_re, a0_im, a1_re, a1_im;

      wire signed [15:0] b0_re, b0_im, b1_re, b1_im;

 
      // Twiddle factor declarations

      wire signed [15:0] w0_re = 16'sd1;    // Real part of W0 (1 + j0)

      wire signed [15:0] w0_im = 16'sd0;    // Imaginary part of W0 (1 + j0)

 
      wire signed [15:0] w1_re = 16'sd0;    // Real part of W1 (0 - j1)

      wire signed [15:0] w1_im = -16'sd1;   // Imaginary part of W1 (0 - j1)

 
      wire signed [15:0] w2_re = -16'sd1;   // Real part of W2 (-1 + j0)

      wire signed [15:0] w2_im = 16'sd0;    // Imaginary part of W2 (-1 + j0)

 
      wire signed [15:0] w3_re = 16'sd0;    // Real part of W3 (0 + j1)

      wire signed [15:0] w3_im = 16'sd1;    // Imaginary part of W3 (0 + j1)

 
      // Stage 1 butterfly calculations

    assign a0_re = x0_re + x2_re;

    assign a0_im = x0_im + x2_im;

    assign a1_re = x1_re + x3_re;

    assign a1_im = x1_im + x3_im;

 
    assign b0_re =  (x0_re - x2_re)*w0_re - (x0_im - x2_im)*(w0_im);

    assign b0_im =  (x0_re - x2_re)*w0_im + (x0_im - x2_im)*(w0_re);

    assign b1_re = (x1_re - x3_re)*w1_re - (x1_im - x3_im)*(w1_im);

    assign b1_im = (x1_re - x3_re)*w1_im + (x1_im - x3_im)*(w1_re);

 
      // Stage 2 butterfly calculations using explicit twiddle factors

      // y0 = a0 + b0

     
 always @(posedge clk)
 begin
 if (reset)
    begin
    y0_re <= 0;
    y0_im <= 0;
    y1_re <= 0;
    y1_im <= 0;
    y2_re <= 0;
    y2_im <= 0;
    y3_re <= 0;
    y3_im <= 0;
   
    end
    else
    begin
     y0_re <= a0_re + a1_re;

     y0_im <= a0_im + a1_im;

 
      // y2 = a0 - b0

     y1_re <= (a0_re - a1_re)*w0_re - (a0_im - a1_im)*w0_im;

     y1_im <= (a0_re - a1_re)*w0_im + (a0_im - a1_im)*w0_re;

 
      // y1 = a1 + w1 * b1

     y2_re <= b0_re + b1_re;

     y2_im <= b0_im + b1_im;

 
      // y3 = a1 + w3 * b1

     y3_re <= (b0_re - b1_re)*w0_re - (b0_im - b1_im)*w0_im;

     y3_im <= (b0_re - b1_re)*w0_im + (b0_im - b1_im)*w0_re;
   
    end
   
 end

endmodule

