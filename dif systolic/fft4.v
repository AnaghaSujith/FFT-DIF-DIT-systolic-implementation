`timescale 1ns / 1ps

module fft4(  

    input wire clk, reset,
    input wire [15:0] x0_re, x0_im, x1_re, x1_im, x2_re, x2_im, x3_re, x3_im,  
    output reg [15:0] y0_re, y0_im, y1_re, y1_im, y2_re, y2_im, y3_re, y3_im  

);  
    wire [15:0] s0_re, s0_im, s1_re, s1_im, s2_re, s2_im, s3_re, s3_im;  

    reg [15:0] s0_re_b, s0_im_b, s1_re_b, s1_im_b, s2_re_b, s2_im_b, s3_re_b, s3_im_b;  
    wire [15:0] y0_re_b, y0_im_b, y1_re_b, y1_im_b, y2_re_b, y2_im_b, y3_re_b, y3_im_b;

    // First stage  
    butterfly bf0(x0_re, x0_im, x2_re, x2_im, 16'h0001, 16'h0000, s0_re, s0_im, s1_re, s1_im);  
    butterfly bf1(x1_re, x1_im, x3_re, x3_im, 16'h0000, 16'hFFFF, s2_re, s2_im, s3_re, s3_im);  
    // Second stage  
    butterfly bf2(s0_re_b, s0_im_b, s2_re_b, s2_im_b, 16'h0001, 16'h0000, y0_re_b, y0_im_b, y1_re_b, y1_im_b);  
  butterfly bf3(s1_re_b, s1_im_b, s3_re_b, s3_im_b, 16'h0001, 16'h0000, y2_re_b, y2_im_b, y3_re_b, y3_im_b);  
  always@(posedge clk) begin  
    if(reset)begin  
    s0_re_b<=0;  
    s0_im_b<=0;    
    s1_re_b<=0;  
    s1_im_b<=0;
    s2_re_b<=0;  
    s2_im_b<=0;  
    s3_re_b<=0;  
    s3_im_b<=0;
   
    y0_re<=0;  
    y0_im<=0;
    y1_re<=0;  
    y1_im<=0;
    y2_re<=0;  
    y2_im<=0;  
    y3_re<=0;  
    y3_im<=0;
         
        end  
    else begin  
    s0_re_b<=s0_re;  
    s0_im_b<=s0_im;
    s1_re_b<= s1_re;  
    s1_im_b<=s1_im;  
    s2_re_b<=s2_re;  
    s2_im_b<=s2_im;  
    s3_re_b<=s3_re;  
    s3_im_b<=s3_im;
   
    y0_re<=y0_re_b;
    y0_im<=y0_im_b;
    y1_re<=y1_re_b;
    y1_im<=y1_im_b;
    y2_re<=y2_re_b;
    y2_im<=y2_im_b;
    y3_re<=y3_re_b;
    y3_im<=y3_im_b;

end
end     

endmodule

	

