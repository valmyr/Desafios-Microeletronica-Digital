`include "./detector_de_sequencia_gen.v"
`timescale 1s/1s
module testbanch_detector();
    logic clk,
          in,
          rst;
    logic [3:0]seq,contador,pulsos,t1,t2;
    logic [2:0] i, serial_check;

   wire s;
    detector_de_sequencia_gen detc1(.clk(clk),
                                .in(in),
                                .rst(rst),
                                .seq(seq),
                                .s(s)
    );
    initial begin
        $monitor("%d %b %d %d |%d",$time,s,i,contador,in);
        $dumpfile("grafico_do_detector_gen.vcd");
        $dumpvars(0,detc1);
    end
    initial begin
        pulsos= 0;
        i = 0;
        serial_check = 3'b100;
        contador = 6;
        clk  = 1'b0;
        rst = 1'b1;
        in = 0;
        seq = 4'b0110;
    end
    always begin
        #1clk = ~clk;
    end
    always@(posedge clk)begin
        pulsos +=1;
        #1in = contador[3-i];
        i += 1;
        if(i == 3) i = 0;
        if(contador > seq)contador =0;
        if(pulsos == 4)begin 
            contador  += 1;
            rst = 1;
        end
        rst = 0;
    end
    initial begin
        #2 rst = 0;
    end
    always  begin
        #101 $finish;

    end
//     //Verificação da sequência 0000
//     initial begin
//         if(seq == 0)begin       
//             #2 rst = 1'b0;
//                 in = 1;
//             #2 in = 0; 
//             #2 in = 1; 
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 1;
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 1;
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 0;
//             #2 in = 1;
//         end
//     end
//    //Verificação da sequência 0001
//         initial begin
//             if(seq == 1)begin       
//                 #2 rst = 1'b0;
//                     in = 1;
//                 #2 in = 0;
//                 #2 in = 1;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 1;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 1;
//             end
//         end
//     //Verificação da sequência 0010
//         initial begin
//             if(seq == 2)begin       
//                 #2 rst = 1'b0;
//                     in = 1;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #2 in = 1;
//                 #2 in = 1;
//                 #2 in = 0;
//                 #2 in = 0;
//                 #1 rst = 1;
//                 #1 rst = 0;
//                 in  = 0;
//                 #2 in  = 0;
//                 #2 in  = 0;
//                 #2 in  = 1;
//                 #2 in  = 0;
//             end
//         end
endmodule