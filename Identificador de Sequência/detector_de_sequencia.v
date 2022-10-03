
//Minúsculo: v, código em ascii: 0x56; 
//Sequência: 0110
module detector_de_sequencia(input  clk,
                             input  in,
                             input rst,
                             output s
                             );
    reg [2:0] current_state, next_state;

    parameter [2:0] S0 = 3'b000,
                    S1 = 3'b001,
                    S2 = 3'b010,
                    S3 = 3'b011,
                    S4 = 3'b100;
    always@(current_state,in)begin
        case(current_state)
            S0 : next_state = in ?  S0 : S1;
            S1 : next_state = in ?  S2 : S1;
            S2 : next_state = in ?  S3 : S1;
            S3 : next_state = in ?  S0 : S4;
            S4 : next_state = in ?  S2  : S1;
            default: next_state = S0;
        endcase
    end
    always@(posedge clk)begin
        current_state <= rst ? S0 : next_state;
    end
    assign s = (S4 == current_state); 
endmodule
