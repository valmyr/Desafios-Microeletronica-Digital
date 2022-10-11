`include "./log2x.sv"

module tb();
    logic clk,rst;
    logic [4:0] a;
    logic [10:0] o;
    log2X log2X_(clk,rst,a,o);
    initial begin
         $dumpfile("1.vcd");
         $dumpvars(0,log2X_);
         clk = 0;
    
    end
    always #1clk = ~ clk;
    initial begin
        a = 15;
        rst  = 1;
        #2 rst = 0;

        #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        a = 14;
        rst  = 1;
        #2 rst = 0;
        #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 3;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 4;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 5;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 6;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 7;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 8;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 9;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 10;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 11;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 12;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 13;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 14;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
        // a = 17;
        // rst  = 1;
        // #2 rst = 0;
        // #70$display("time = %g, log2(%.2f) = %b.%b %.2f",$time, a,o[10:5],o[4:0],(o*(2.0**-5.0)));
    end
    initial #100000$finish;


endmodule