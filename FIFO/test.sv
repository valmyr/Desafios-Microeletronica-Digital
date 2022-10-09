`include "./fifo.sv"
module tb();
    logic clk,enable;
    logic [7:0] data_in, data_out;
    fifo inst1(clk,enable,data_in,data_out);
    initial begin
        $monitor("%d",data_out);
        $dumpfile("fifo.vcd");
        $dumpvars(inst1);
    end

    initial begin
        clk = 0;
        enable = 1;
    end
    always #1clk = ~clk;
    initial begin
        #2data_in = 9;
        #2data_in = 45;
        #2data_in = 10;
    end

endmodule