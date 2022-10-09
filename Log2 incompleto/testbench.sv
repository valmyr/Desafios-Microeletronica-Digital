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
         clk = 0;
    
    end
    always #1clk = ~ clk;
    initial begin
        a[4:0] = 10;
        a[-1:-3] = 0.5;
        rst  = 1;
        #2 rst = 0;
        #70$display("time = %g, log2(%.2f) = %b %.2f",$time, a*(2.0**-4.0),o,(o*(2.0**-5.0)));

    end
    initial #100$finish;


endmodule