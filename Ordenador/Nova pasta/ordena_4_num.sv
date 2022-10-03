`include "ordena_2_num.sv"
module ordena_4_num(input  logic ena,
                    input  logic cresc_ou_decres,
                    input  logic [7:0]desordenado[3:0],
                    output logic [7:0]ordenado[3:0]
                  );
    wire [7:0] x1[2:0];
    wire [7:0] x2[2:0];
    ordena_2_num ordenador_2_inst1(ena,cresc_ou_decres,desordenado[0],desordenado[1],x1[0],x2[0]);
    ordena_2_num ordenador_2_inst2(ena,cresc_ou_decres,desordenado[2],desordenado[3],x1[1],x2[1]);
    ordena_2_num ordenador_2_inst3(ena,cresc_ou_decres,x1[0],x1[1],ordenado[0],x2[2]);
    ordena_2_num ordenador_2_inst4(ena,cresc_ou_decres,x2[0],x2[1],x1[2],ordenado[3]);
    ordena_2_num ordenador_2_inst5(ena,cresc_ou_decres,x1[2],x2[2],ordenado[1],ordenado[2]);
endmodule
