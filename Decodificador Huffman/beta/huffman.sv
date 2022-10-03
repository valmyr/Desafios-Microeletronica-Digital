module huffman(input  logic clk,
               input logic rst,
               input  logic in,
               output logic [5:0] huffman_outp);
    parameter [5:0] start = 0;
    parameter [5:0] intermediate_step_01 = 6'b100001;
    parameter [5:0] intermediate_step_02 = 6'b100100; 
    parameter [5:0] intermediate_step_03 = 6'b100101;
    parameter [5:0] intermediate_step_04 = 6'b100111;
    parameter [5:0] intermediate_step_05 = 6'b101000;
    parameter [5:0] intermediate_step_06 = 6'b101001;


    parameter [5:0] code_word_01 = 6'b000010;
    parameter [5:0] code_word_02 = 6'b000011;
    parameter [5:0] code_word_03 = 6'b000110;
    parameter [5:0] code_word_04 = 6'b000111;
    parameter [5:0] code_word_05 = 6'b001000;
    parameter [5:0] code_word_06 = 6'b001001;


    logic [5:0] next_state, current_state;
    always@(current_state,in)begin
        case(current_state)
            //start                  : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            intermediate_step_01   : next_state =  in ? code_word_02         : code_word_01;
            code_word_01           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            code_word_02           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            intermediate_step_02   : next_state =  in ? intermediate_step_03 : code_word_03; 
            code_word_03           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            intermediate_step_03   : next_state =  in ? intermediate_step_04 : code_word_04;
            code_word_04           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            intermediate_step_04   : next_state =  in ? intermediate_step_02 : intermediate_step_05;
            intermediate_step_05   : next_state =  in ? intermediate_step_02 : intermediate_step_06;
            intermediate_step_06   : next_state =  in ? code_word_06         : code_word_05;
            code_word_05           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            code_word_06           : next_state =  in ? intermediate_step_02 : intermediate_step_01;
            default: next_state =  in ? intermediate_step_02 : intermediate_step_01;
        endcase
    end
    always@(posedge clk)begin
       current_state <= rst ? 0:next_state;
    end

    assign huffman_outp = (current_state == code_word_01 ) ? 1 :
                          (current_state == code_word_02 ) ? 2 :
                          (current_state == code_word_03)  ? 3 :
                          (current_state == code_word_04)  ? 4 :
                          (current_state == code_word_05)  ? 5 :0;


endmodule