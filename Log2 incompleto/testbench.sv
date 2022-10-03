`include "./normalizacao.sv"
parameter E_int = 4;
parameter D_frac = 3;
module tb();
    logic clk,rst;
    logic signed [8:0] valor;
    logic [8:0] saida;
    log2 normalizacao(clk,rst,valor,saida);
    initial begin
         $monitor("%d", (saida));
         clk = 0;
         rst = 0;
         $dumpfile("normalizacao.vcd");
         $dumpvars(0,normalizacao);
    end
    always #1clk = ~ clk;
    initial begin
       valor = 5;
        // valor = 4.5;
        rst= 1;
        #1rst= 0;
    
    end
    initial #100 $finish;


endmodule