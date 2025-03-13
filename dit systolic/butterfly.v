`timescale 1ns / 1ps

module butterfly(
    input [15:0] a_re, a_im, b_re, b_im, tw_re, tw_im,  
    output [15:0] y0_re, y0_im, y1_re, y1_im
);
    wire signed [31:0] mul0_re, mul0_im;
    // Complex multiplication
    assign mul0_re = b_re * tw_re - b_im * tw_im;
    assign mul0_im = b_re * tw_im + b_im * tw_re;
    // Truncate to 16 bits
  assign y0_re = a_re + mul0_re[15:0];
  assign y0_im = a_im + mul0_im[15:0];
  assign y1_re = a_re - mul0_re[15:0];
  assign y1_im = a_im - mul0_im[15:0];

endmodule
