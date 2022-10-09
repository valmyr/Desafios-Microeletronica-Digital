module log2(input  logic clk,rst,
            input  logic [41:0] inputValue,
            output logic [41:0] valueNormalized
            );
    logic [41:0] inputValue_;
    always@(posedge clk)begin
        if(rst)
        inputValue_ = inputValue;
        else begin
            if(inputValue_[41] != 1)begin
                inputValue_ = inputValue_ *  inputValue_;
            end
        end
    end
  //  assign valueNormalized = inputValue_;
endmodule