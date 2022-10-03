module huffman_decoder_serial(input  logic clk,
               input logic rst,
               input  logic in,
               output logic [5:0] huffman_outp);
    logic [7:0] buffer;
    logic [3:0] next_counter,counter;
    logic y;
    parameter [1:0] S1  =       2'b00;
    parameter [1:0] S2  =       2'b01;
    parameter [1:0] S3  =       2'b10;
    parameter [2:0] S4  =      3'b110;
    parameter [5:0] S5  =   6'b111000;
    parameter [5:0] S6  =   6'b111001;
    parameter [5:0] S7  =   6'b111010;
    parameter [6:0] S8  =  7'b1110110;
    parameter [6:0] S9  =  7'b1110111;
    parameter [6:0] S10 =  7'b1111000;
    parameter [6:0] S11 =  7'b1111001;
    parameter [6:0] S12 =  7'b1111010;
    parameter [6:0] S13 =  7'b1111011;
    parameter [6:0] S14 =  7'b1111100;
    parameter [6:0] S15 =  7'b1111101;
    parameter [6:0] S16 =  7'b1111110;
    parameter [7:0] S17 = 8'b11111110;
    parameter [7:0] S18 = 8'b11111111;
    always@(counter)begin
        case(counter)
            4'bzzzz:begin next_counter = 0;
            end
            0:begin next_counter = 1;
                    buffer[7] = in;
                    y = 0;
            end
            1:begin next_counter = 2;
                    buffer[6] = in;
                    case (buffer[7:6])
                    S1:begin
                        huffman_outp = 1;
                        y = 1;
                    end
                    S2:begin
                        huffman_outp = 2;
                        y = 1;
                    end 
                    S3:begin 
                        huffman_outp = 3;
                        y = 1;
                    end
                endcase 
            end
            2:begin next_counter = 3;
                    buffer[5] = in;
                    case(buffer[7:5])
                    S4:begin
                        huffman_outp = 4;
                        y = 1;
                    end
                endcase
                    
            end
            3:begin next_counter = 4;
                    buffer[4] = in;
                    y = 0;
            end
            4:begin next_counter = 5;
                    buffer[3] = in;
                    y = 0;
            end
            5:begin next_counter = 6;
                    buffer[2] = in;
                    case(buffer[7:2])
                    S5:begin
                        huffman_outp = 5;
                        y = 1;
                    end
                    S6:begin
                        huffman_outp = 6;
                        y = 1;
                    end
                    S7:begin
                        huffman_outp = 7;
                        y =1;
                    end
                    default: y = 0;    
                endcase 
                    
            end
            6:begin next_counter = 7;
                buffer[1] = in;
                case(buffer[7:1])//110110
                S8:begin
                    huffman_outp = 8;
                    y = 1;
                end
                S9:begin
                    huffman_outp = 9;
                    y = 1;

                end
                S10:begin
                    huffman_outp = 10;
                    y = 1;

                end
                S11:begin
                    huffman_outp = 11;
                    y = 1;

                end
                S12:begin
                    huffman_outp = 12;
                    y = 1;

                end
                S13:begin
                    huffman_outp = 13;
                    y = 1;

                end
                S14:begin
                    huffman_outp = 14;
                    y = 1;

                end
                S15:begin
                    huffman_outp = 15;
                    y = 1;

                end
                S16:begin
                    huffman_outp = 16;
                    y = 1;
                end
                default: y = 0;
            endcase 

            end
            7:begin next_counter  =4'bzzzz;
                buffer[0] = in;
                case (buffer)
                S17:begin
                    y = 1;
                    huffman_outp = 17;
                end
                S18:begin
                    huffman_outp = 18;
                    y = 1;
                end
                default: y = 0;
                endcase 
            end

        endcase

    end
    always@(posedge clk)begin
        if(rst)begin
            counter <= 4'bzzzz;
        end
        else begin
            counter <= next_counter;
        end
        if(y)begin
            counter <= 0;
        end
    end
endmodule