`include "./ordena_2_num.v"
module testbench();
    wire [8:0]
                   n1,
                   n2;
    logic [8:0] n1_n,
                n2_n;
    logic ena,clk;
    ordena_2_num ordenador(ena,n1_n,n2_n,n1,n2);
    initial begin
        $display("ena|  desordenado  |   ordenado");
        $monitor("%d  |%d %d| %d %d",ena,n1_n,n2_n,n1,n2);
    end
    initial begin
        clk = 0;
        ena = 0;
    end
    always begin
        #1clk = ~clk;
    end
    always @(negedge clk)begin
        ena = 1;
    end
    always @(posedge clk ) begin
        ena = 1;
        n1_n = 1;//$urandom_range($pow(2,8)-1,0);
        n2_n = 1;//$urandom_range($pow(2,8)-1,0);
    end
    initial begin
        #200$finish;
    end
endmodule