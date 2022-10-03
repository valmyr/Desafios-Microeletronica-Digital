`include "./detector_de_sequencia.v"
module testbanch_detector();
    logic clk,
          in,
          rst;
   wire s;
    detector_de_sequencia detc1(.clk(clk),
                                .in(in),
                                .rst(rst),
                                .s(s)
    );

    initial begin
        clk  = 1'b0;
        in = 1;
        #2
        //in   = 1'b0;
        rst = 1'b1;
        rst = 1'b0;
    end

    initial begin
        $display("\n\nInicio do test de bancada");
        $display("\nin , s");
        $monitor("%b , %b",in,s);
        $dumpfile("grafico_do_detector.vcd");
        $dumpvars(0,detc1);
        #52$finish;
    end
    always begin
        #1 clk = ~clk;
    end
    initial begin
        in = 0;
        #2 in = 1; //estado esperado: s0
        #2 in = 0; //estado esperado: s1
        #2 in = 0; //estado esperado: s1
        #2 in = 1; //estado esperado: s2
        #2 in = 0; //estado esperado: s1
        #2 in = 1; //estado esperado: s2
        #2 in = 1; //estado esperado: s3
        #2 in = 1; //estado esperado: s0
        #2 in = 0; //estado esperado: s1
        #2 in = 1; //estado esperado: s2
        #2 in = 1; //estado esperado: s3
        #2 in = 0; //estado esperado: s4, s = 1
        #2 in = 1; //estado esperado: s2
        #2 in = 1; //estado esperado: s3
        #2 in = 0; //estado esperado: s4, s = 1
        #2 in = 1;
        #2 in = 1;
        #2 in = 0;
        #2 in = 1; //estado esperado: s2
        #2 in = 1; //estado esperado: s3
        #2 in = 0; //estado esperado: s4, s = 1
        #2 in = 1;
        #2 in = 1;
        #2 in = 0;
        #2 in = 1; //estado esperado: s2
        #2 in = 1; //estado esperado: s3
        #2 in = 0; //estado esperado: s4, s = 1
        #2 in = 1;
        #2 in = 1;
        #2 in = 0;
    end

endmodule