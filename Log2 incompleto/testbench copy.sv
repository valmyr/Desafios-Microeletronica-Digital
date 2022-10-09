`include "./log2x.sv"

module tb();
localparam SF = 2**-3;
    logic clk,rst;
    logic [4:-3] a;
    logic [10:0] o;
    log2X log2X_(clk,rst,a,o);
    initial begin
         $dumpfile("1.vcd");
         $dumpvars(0,log2X_);
         $monitor("%b|%f", a,o);
         clk = 0;
    
    end
    always #1clk = ~ clk;
    initial begin
        a[4:0] = 15;
        a[-1:-3] = 0;
       rst  = 1;
        #2 rst = 0;
        #90$display("time = %g, log2(%f) = %b %f",$time, a,o, $itor(o[4:0]*2**-5));

    end
    initial #101 $finish;


endmodule