module log2X(input clk,
        input rst,
       input logic  [4:-3] x_,
       output logic [10:0] log2_x);

    logic [4:0] exp;
    logic [4:-3] x;
    logic [127:0] mant;
    logic [4:0] log2m;
    logic y;
    logic [3:0]  aprox, i;
    logic [32:0] inter;
    initial begin 
        exp = 0;
        aprox = 5;
        log2m = 0;
        y = 0;
        i = 0;
        mant = 0;
        x =0;
    end
    always@(posedge clk,posedge rst)begin
        if(rst) x = x_;
        else
            if(x[4:0] != 1)begin
                x = x >> 1;
                exp = exp + 1;
                mant = x;

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
   assign log2_x = y ? {exp,log2m}:0;
endmodule