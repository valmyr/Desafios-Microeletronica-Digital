`include "huffman_dec.sv"
module tb();
    logic clk,in,rst;
    wire [5:0] huffman_outp;
    logic [7:0] i,num;

    huffman_decoder_serial huffman_dec(.clk(clk),.rst(rst),.in(in),.huffman_outp(huffman_outp));
    initial begin
        clk = 0;
        in = 1;
        rst = 1;
        in = 1'b0;
        i = 0;
    end
    initial begin

        $dumpfile("huffman_dec.vcd");
        $dumpvars(0,huffman_dec);
    end
    always #1clk = ~clk;
    initial begin
        #2 rst =0;
         in =0;
       #2  in =0;
       #2  in =0;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =0;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =0;
       #2  in =1;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =1;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =1;
       #2  in =1;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =0;
       #2  in =0;


       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =0;
       #2  in =1;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;
       #2  in =1;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;
       #2  in =1;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =0;

       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
       #2  in =1;
        #100$finish;
    end
endmodule
// parameter     start =        1'b0;
// parameter [1:0] S1  =       2'b00;
// parameter [1:0] S2  =       2'b01;
// parameter [1:0] S2  =       2'b01;
// parameter [1:0] S3  =       2'b10;
// parameter [2:0] S4  =      3'b110;
// parameter [5:0] S5  =   6'b111000;
// parameter [5:0] S6  =   6'b111001;
// parameter [5:0] S7  =   6'b111010;
// parameter [6:0] S8  =  7'b1110110;
// parameter [6:0] S9  =  7'b1110111;
// parameter [6:0] S10 =  7'b1111000;
// parameter [6:0] S11 =  7'b1111001;
// parameter [6:0] S12 =  7'b1111010;
// parameter [6:0] S13 =  7'b1111011;
// parameter [6:0] S14 =  7'b1111100;
// parameter [6:0] S15 =  7'b1111101;
// parameter [6:0] S16 =  7'b1111110;
// parameter [7:0] S17 = 8'b11111110;
// parameter [7:0] S18 = 8'b11111111;