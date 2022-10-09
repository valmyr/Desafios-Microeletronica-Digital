module norm(input clk,
            input logic [i:f] a,
            output logic [i:f] out);
    logic [i:f] x,y;
    logic rst ,s;
    logic [4:0] cont_div;
    initial begin
        rst = 0;   
        s = 0;

    end
    always@(posedge clk)begin
        if(~rst)begin 
            rst = 1;
            x = a;
            cont_div = 0;
        end
        if(x[i:0] != 10'b00001)begin
             x = x >> 1;
             cont_div+=1;
             y = x[-1:f];
        end
        else begin
            if(y[i] != 1)
                y = y << 1;
            else begin s = 1;
                y[0] = 0;
            end
        end
    end
    //assign out = s ? {y[i:0],cont_div}:0;
endmodule