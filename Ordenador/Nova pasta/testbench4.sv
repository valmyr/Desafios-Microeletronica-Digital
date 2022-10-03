`include "./ordena_4_num.sv"
module testbench();
    logic [8:0] desordenado[3:0],i;
    wire [8:0] ordenado[3:0];
    logic ena,clk,cresc_ou_desc;
    ordena_4_num ordenador(ena,cresc_ou_desc,desordenado,ordenado);
    initial begin
        $display("ena|  desordenado  |   ordenado");
        $monitor("%d  |%d %d %d %d| %d %d %d %d",ena,desordenado[0],
                                                     desordenado[1],
                                                     desordenado[2],
                                                     desordenado[3],
                                                     ordenado[0],
                                                     ordenado[1],
                                                     ordenado[2],
                                                     ordenado[3]
                );
    end
    initial begin
        clk = 0;
        ena = 0;
        cresc_ou_desc = 0;
        i = 0;
    end
    always begin
        #1clk = ~clk;
    end
    always @(negedge clk)begin
        ena = 1;
    end
    always @(posedge clk ) begin
        ena = 1;
        if(i == 0)begin
            desordenado[0] = 1;
            desordenado[1] = 2;
            desordenado[2] = 3;
            desordenado[3] = 4;
        end
        else if(i == 1)begin
            desordenado[0] = 4;
            desordenado[1] = 3;
            desordenado[2] = 2;
            desordenado[3] = 1;
        end
        else begin
            desordenado[0] = $urandom_range($pow(2,8)-1,0);
            desordenado[1] = $urandom_range($pow(2,5)-1,0);
            desordenado[2] = $urandom_range($pow(2,4)-1,0);
            desordenado[3] = $urandom_range($pow(2,3)-1,0);
        end
        i+=1;
    end
    initial begin
        #200$finish;
    end
endmodule