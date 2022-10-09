module log2X(input clk,
        input rst,
       input logic  [7:0] x_,
       output logic [10:0] log2_x);
    logic [3:0] exp;
    logic [7:-8] x;
    logic [127:0] mant;
    logic [4:0] log2m;
    logic y,normalizado;
    logic [3:0]  aprox, i;
    initial begin 
        exp = 0;
        aprox = 5;
        log2m = 0;
        y = 0;
        i = 0;
        mant = 0;
        x =0;
        normalizado = 0;
    end
    always@(x) begin
        casez(x[7:0])
            8'b00000001:begin
                x = x >> 0;
                normalizado =1;
            end
            8'b0000001z:begin
                exp = 1;
                x = x >> 1;
                normalizado =1;
            end
            8'b000001zz:begin
                exp = 2;
                x = x >> 2;
                normalizado =1;
            end
            8'b00001zzz:begin
                exp = 3;
                x = x >> 3;
                normalizado =1;
            end
            8'b0001zzzz:begin
                exp = 4;
                x = x >> 4;
                normalizado =1;
            end
            8'b001zzzzz:begin
                exp = 5;
                x = x >> 5;
                normalizado =1;
            end
            8'b01zzzzzz:begin
                exp = 6;
                x = x >> 6;
                normalizado =1;
            end
            8'b1zzzzzzz:begin
                exp = 7;
                x = x >> 7;
                normalizado =1;
            end
        endcase
    end

    always@(posedge clk,posedge rst)begin
        if(rst)begin x[7:0] = x_;
            x[-1:-8] = 0;
            normalizado = 0;
        end
        else
            if(normalizado)begin
                normalizado = 0;
                mant = x_;
            end
            else begin
                if(i < aprox)begin
                    mant = (mant * mant);
                    i = i + 1;
                end
                else begin
                    if(mant[127:96] != 1)begin
                        mant = mant >> 1;
                        log2m = log2m + 1; 
                    end
                    else y = 1;
                end
            end
        end
   assign log2_x = (x_ == 0) ? 11'bzzzzzzzzzz: y ? {exp,log2m}:0;
endmodule