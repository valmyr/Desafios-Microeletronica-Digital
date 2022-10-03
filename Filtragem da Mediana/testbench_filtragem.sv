`include "filtragem_da_mediana.sv"
module testbench();
    wire [7:0] mediana;
    logic [7:0] n1_n,
                n2_n,
                n3_n,
                n4_n,
                n5_n,
                n6_n,
                n7_n,
                n8_n,
                n9_n,
                i;
    logic ena,clk;
    filtragem_da_mediana filtro(ena,
                           n1_n,
                           n2_n,
                           n3_n,
                           n4_n,
                           n5_n,
                           n6_n,
                           n7_n,
                           n8_n,
                           n9_n,
                           mediana
                           );
    initial begin
        $display("\n\nena|               ordenado          |   mediana");
        $monitor("%d  |%d %d %d %d %d %d %d %d %d| %d",ena,n1_n,n2_n,n3_n,n4_n,n5_n,n6_n,n7_n,n8_n,n9_n,mediana);
    end
    initial begin
        clk = 0;
        ena = 0;
        i =0;
    end
    always begin
        #1clk = ~clk;
    end
    always @(posedge clk ) begin
        if(i == 0)begin
            n1_n = 0;
            n2_n = 1;
            n3_n = 2;
            n4_n = 3;
            n5_n = 4;
            n6_n = 5;
            n7_n = 6;
            n8_n = 7; 
            n9_n = 8; 

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
            n8_n = 0; 

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
            n9_n = 7; 

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
            n9_n = $urandom_range($pow(2,8)-1,0);

        end
        i+=1;
    end
    initial begin
        #200$finish;
    end

    
endmodule