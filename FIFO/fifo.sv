module FFD(input logic clk,
            input logic rst,
            input logic carregar_data,
            input logic fila_cheia,
            input logic [7:0]d,
            output logic [7:0] q);

    always@(posedge clk)begin
        // case({rst,fila_cheia,carregar_data})
        //     // 3'b1xx:q <= 0;
        //     // 3'bx1x:q <= q;
        //     // 3'b001: q <= d;
        //     // default: q <= 0;
        // endcase
        q <= rst ? 0:d;
    end
endmodule

module fifo(input logic clk,
            input logic rst,
            input logic carregar_data,
            input logic [7:0] data_ent,
            output logic [7:0] data_sai,
            output logic fila_cheia);
    logic [7:0]w[5:0];
    FFD ff1(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(data_ent),.q(w[0]));
    FFD ff2(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[0]),.q(w[1]));
    FFD ff3(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[1]),.q(w[2]));
    FFD ff4(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[2]),.q(w[3]));
    FFD ff5(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[3]),.q(w[4]));
    FFD ff6(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[4]),.q(w[5]));
    FFD ff7(.clk(clk),.rst(rst),.carregar_data(carregar_data),.fila_cheia(fila_cheia),.d(w[5]),.q(data_sai));
    // assign fila_cheia = (data_sai != 0) & (w[0] != 0) ? 1:0;
endmodule