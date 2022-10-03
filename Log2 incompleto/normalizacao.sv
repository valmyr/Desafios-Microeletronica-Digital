


module log2(input  logic clk,rst,
            input  logic [8:0] inputValue,
            output logic [8:0] valueNormalized
            );
    logic [8:0] expoente_j;
    logic [8:0] _inputValue_;
    logic [2:0] base2;

    logic y;
    always@(posedge clk)begin
        if(_inputValue_[8] != 1'b1 && expoente_j !=0)begin
            _inputValue_ = _inputValue_ << 1;
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
            expoente_j = 8;
            _inputValue_ = inputValue;
            valueNormalized = 0;
            y = 1;
            base2 = 3'b100;
        end
    end
endmodule