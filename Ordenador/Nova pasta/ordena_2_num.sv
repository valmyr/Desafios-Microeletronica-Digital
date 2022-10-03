//crescente = 1;
//decrescente = 0;
//ena = 0; saida = entrada
module ordena_2_num(input  logic ena,
                    input  logic cresc_ou_decres,
                    input  logic [7:0] n1, 
                    input  logic [7:0] n2,
                    output logic [7:0] menor,
                    output logic [7:0] maior
);
  wire n1_maior_n2 = (n1 > n2);
  wire n2_maior_n1 = (n2 > n1);
  wire n1_igual_n2 = (n2 == n1);

  always @(*) begin
    casex({ena,cresc_ou_decres,n1_igual_n2,n2_maior_n1,n1_maior_n2})
         5'b0xxxx:begin
           maior = n2;
           menor = n1;
         end
         5'b11001:begin
            maior = n1;
            menor = n2;
         end
         5'b11010:begin
            maior = n2;
            menor = n1;
         end
         5'b10001:begin
            maior = n2;
            menor = n1;
         end
         5'b10010:begin
            maior = n1;
            menor = n2;          
         end
         default:begin
            maior = n1;
            menor = n2;
         end
    endcase
  end
endmodule
