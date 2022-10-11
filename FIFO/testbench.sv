`include "./fifo.sv"
module tb();
    logic clk,rst,carregar_data,fila_cheia;
    logic [7:0] data_ent, data_sai;
    fifo inst1(.clk(clk),.rst(rst),.carregar_data(carregar_data),.data_ent(data_ent),.data_sai(data_sai),.fila_cheia(fila_cheia));
    initial begin
        $monitor("%d",data_sai);
        $dumpfile("fifo.vcd");
        $dumpvars(0,inst1);
    end

    initial begin
        clk = 0;
        carregar_data = 1;
        rst = 1;

    end
    always #1clk = ~clk;
    initial begin
        #2rst = 0;
        data_ent = 1;
        #2data_ent = 2;
        #2data_ent = 3;
        #2data_ent = 4;
        #2data_ent = 5;
        #2data_ent = 6;
        #2data_ent = 7;
        #2data_ent = 8;
        #2data_ent = 9;
    end
    initial
    #50 $finish;

endmodule