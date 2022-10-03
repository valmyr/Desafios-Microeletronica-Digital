`include "./ordena_8_num.v"
module testbench();
    wire [8:0]
                   n1,
                   n2,
                   n3,
                   n4,
                   n5,
                   n6,
                   n7,
                   n8;
    logic [8:0] n1_n,
                n2_n,
                n3_n,
                n4_n,
                n5_n,
                n6_n,
                n7_n,
                n8_n,i;
    logic ena,clk,cresc_ou_decres;
    ordenador_8_numeros_8bits ordenador(ena,
                           cresc_ou_decres,
                           n1_n,
                           n2_n,
                           n3_n,
                           n4_n,
                           n5_n,
                           n6_n,
                           n7_n,
                           n8_n,
                           n1,
                           n2,
                           n3,
                           n4,
                           n5,
                           n6,
                           n7,
                           n8
                           );
    initial begin
        $display("\n\nena|          desordenado          |   ordenado");
        $monitor("%d  |%d %d %d %d %d %d %d %d| %d %d %d %d %d %d %d %d",ena,n1_n,n2_n,n3_n,n4_n,n5_n,n6_n,n7_n,n8_n,n1,n2,n3,n4,n5,n6,n7,n8);
    end
    initial begin
        clk = 0;
        ena = 0;
        i =0;
        cresc_ou_decres= 0;
    end
    always begin
        #1clk = ~clk;
    end
    always @(posedge clk ) begin
        if(i == 0)begin
            n1_n = 1;
            n2_n = 2;
            n3_n = 3;
            n4_n = 4;
            n5_n = 5;
            n6_n = 6;
            n7_n = 7;
            n8_n = 8; 
        end
        else if(i == 1)begin
            n1_n = 8;
            n2_n = 7;
            n3_n = 6;
            n4_n = 5;
            n5_n = 4;
            n6_n = 3;
            n7_n = 2;
            n8_n = 1; 
        end
        else if(i == 2)begin
            n1_n = 7;
            n2_n = 7;
            n3_n = 7;
            n4_n = 7;
            n5_n = 7;
            n6_n = 7;
            n7_n = 7;
            n8_n = 7; 
        end
        else begin
            n1_n = $urandom_range($pow(2,2)-1,0);
            n2_n = $urandom_range($pow(2,3)-1,0);
            n3_n = $urandom_range($pow(2,4)-1,0);
            n4_n = $urandom_range($pow(2,5)-1,0);
            n5_n = $urandom_range($pow(2,6)-1,0);
            n6_n = $urandom_range($pow(2,7)-1,0);
            n7_n = $urandom_range($pow(2,8)-1,0);
            n8_n = $urandom_range($pow(2,8)-1,0);
        end
        i+=1;
    end
    initial begin
        #200$finish;
    end

    
endmodule