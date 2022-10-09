module fifo(input logic clk,
            input logic enable,
            input logic [7:0] data_in,
            output logic [7:0] data_out);
logic [63:0] reg_;
logic [3:0] next_state, current_state,i;
initial i = 1;
always@(posedge clk)begin
    if(enable && i < 9)begin
        reg_[(2*4*i - 1):(2*4*(i-1))] <= data_in;
        i+=1;
    end
end
endmodule