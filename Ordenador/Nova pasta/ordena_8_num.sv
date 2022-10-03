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
module ordena_4_num(input  logic ena,
                    input  logic cresc_ou_decres,
                    input  logic [7:0][3:0]desordenado,
                    output logic [7:0][3:0]ordenado
                  );
    wire [7:0] x1[2:0];
    wire [7:0] x2[2:0];
    ordena_2_num ordenador_2_inst1(ena,cresc_ou_decres,desordenado[0],desordenado[1],x1[0],x2[0]);
    ordena_2_num ordenador_2_inst2(ena,cresc_ou_decres,desordenado[2],desordenado[3],x1[1],x2[1]);
    ordena_2_num ordenador_2_inst3(ena,cresc_ou_decres,x1[0],x1[1],ordenado[0],x2[2]);
    ordena_2_num ordenador_2_inst4(ena,cresc_ou_decres,x2[0],x2[1],x1[2],ordenado[3]);
    ordena_2_num ordenador_2_inst5(ena,cresc_ou_decres,x1[2],x2[2],ordenado[1],ordenado[2]);
endmodule
module ordena_8_num(input  wire ena,
                       input  wire cresc_ou_decres,
                       input  wire [7:0][7:0]desordenado,
                       output wire [7:0][7:0]ordenado
                    );
    logic [7:0] x1[3:0] = desordenado[3:0];
    logic [7:0] x2[3:0] = x2[3:0];
    ordena_4_num ordenador_4_inst1(ena,cresc_ou_decres,desordenado[3:0],ordenado[3:0]);
    //ordena_4_num ordenador_4_inst2(ena,cresc_ou_decres,desordenado[7:4],{x1[1],x2[1],x3[1],x4[1]});
    //ordena_4_num ordenador_4_inst3(ena,cresc_ou_decres,{x1[0],x2[0],x1[1],x2[1]},{ordenado[1:0],x1[2],x2[2]});
    //ordena_4_num ordenador_4_inst4(ena,cresc_ou_decres,{x3[0],x4[0],x3[1],x4[1]},{x3[2],x4[2],ordenado[7:6]});
    //ordena_4_num ordenador_4_inst5(ena,cresc_ou_decres,{x1[2],x2[2],x3[2],x4[2]},ordenado[5:2]);
    
endmodule
// module ordena_8_num(input ena,
//                     input cresc_ou_decres,
//                     input [8:0]n1_n,
//                     input [8:0]n2_n,
//                     input [8:0]n3_n,
//                     input [8:0]n4_n,
//                     input [8:0]n5_n,
//                     input [8:0]n6_n,
//                     input [8:0]n7_n,
//                     input [8:0]n8_n,
//                     output[8:0]n1,
//                     output[8:0]n2,
//                     output[8:0]n3,
//                     output[8:0]n4,
//                     output[8:0]n5,
//                     output[8:0]n6,
//                     output[8:0]n7,
//                     output[8:0]n8
// );
//    wire [8:0]x1[2:0],
//              x2[2:0],
//              x3[2:0],
//              x4[2:0];
//     ordena_4_num ordenador_4_inst1(ena,cresc_ou_decres,n1_n,n2_n,n3_n,n4_n,x1[0],x2[0],x3[0],x4[0]);
//     ordena_4_num ordenador_4_inst2(ena,cresc_ou_decres,n5_n,n6_n,n7_n,n8_n,x1[1],x2[1],x3[1],x4[1]);
//     ordena_4_num ordenador_4_inst3(ena,cresc_ou_decres,x1[0],x2[0],x1[1],x2[1],n1,n2,x1[2],x2[2]);
//     ordena_4_num ordenador_4_inst4(ena,cresc_ou_decres,x3[0],x4[0],x3[1],x4[1],x3[2],x4[2],n7,n8);
//     ordena_4_num ordenador_4_inst5(ena,cresc_ou_decres,x1[2],x2[2],x3[2],x4[2],n3,n4,n5,n6);
// endmodule