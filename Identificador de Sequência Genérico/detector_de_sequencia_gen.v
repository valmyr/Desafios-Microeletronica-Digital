
//Minúsculo: v, código em ascii: 0x56; 
//Sequência: 0110
module detector_de_sequencia_gen(input  clk,
                                 input  in,
                                 input  rst,
                                 input  [3:0]seq,
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
            S0 : next_state = (in == seq[3]) ?  S1 : 
                                                S0 ;

            S1 : next_state = (in == seq[2]) ?  S2 :
                              (in == seq[3]) ?  S1 : 
                                                S0 ;

            S2 : next_state = (in == seq[1]) ?  S3 :
                              (in == seq[2]) ?  S2 :
                              (in == seq[3]) ?  S1 : 
                                                S0 ;

            S3 : next_state = (in == seq[0]) ?  S4 :  
                              (in == seq[1]) ?  S3 :
                              (in == seq[2]) ?  S2 :
                              (in == seq[3]) ?  S1 : 
                                                S0 ;

                                                
            S4: next_state =  (in == seq[0]) ?  S4 :  
                              (in == seq[1]) ?  S3 :
                              (in == seq[2]) ?  S2 :
                              (in == seq[3]) ?  S1 : 
                                                S0 ;
            default: next_state = S0;
        endcase
    end
    always@(posedge clk,posedge rst)begin
        current_state <= rst ? S0 : next_state;
    end
    assign s = (S4 == current_state); 
endmodule
