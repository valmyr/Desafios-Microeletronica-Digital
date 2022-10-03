


module log2(input  logic clk,rst,
            input  logic [E_int:-D_frac] inputValue,
            output logic [E_int:-D_frac] valueNormalized
            );
    logic [E_int:0] expoente_j,i;
    logic [E_int:-D_frac] inputValue_,k;
    logic [2:0] base2;

    logic y;
    always@(posedge clk)begin
        if(inputValue_[E_int] != 1'b1 && expoente_j !=0)begin
            inputValue_ = inputValue_ << 1;
            expoente_j = expoente_j - 1;
        end
        else if(y)begin
            base2 = base2 >> (expoente_j);
            y =0;
        end
        else
            valueNormalized = inputValue*(base2);
    end

    always@(negedge rst) begin
        if(~rst)begin
            expoente_j = E_int;
            inputValue_ = inputValue;
            valueNormalized = 1;
            y = 1;
            base2 = 3'b100;
        end
    end
endmodule