module huffman(input  logic clk,
               input logic rst,
               input  logic in,
               output logic [5:0] huffman_outp);
    logic [8:0] buffer_in, buffer_out, pulser_counter;

    always@(posedge clk,posedge rst)begin
        if(rst)begin 
            pulser_counter <= 0;
            huffman_outp = 0;
            buffer_in <= {8{'z}};
        end
        else begin
            buffer_in[7-pulser_counter] <= in ;
            pulser_counter <= pulser_counter + 1;
            if(pulser_counter >= 10)pulser_counter <= 0;
        end
    end
    always @(*) begin
            case(pulser_counter)
                9'b00000010:begin
                    case (buffer_in[7:6])
                    2'b00:begin
                        huffman_outp = 1;
                        pulser_counter <= 0;
                        buffer_in <= {8{'z}};
                    end
                    2'b01:begin
                        huffman_outp = 2;
                        pulser_counter <= 0;
                        buffer_in <= {8{'z}};
                    end 
                    2'b10:begin 
                        huffman_outp = 3;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end 
                    default:huffman_outp = 0;
                endcase 
                end
                9'b00000011:begin
                    case(buffer_in[7:5])
                        3'b110:begin
                            huffman_outp =4;
                            buffer_in <= {8{'z}};
                            pulser_counter <= 0;
                        end
                    endcase
                end
                9'b000000110:begin
                    case(buffer_in[7:2])
                    6'b111000:begin
                        huffman_outp = 5;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    6'b111001:begin
                        huffman_outp = 6;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    6'b111010:begin
                        huffman_outp = 7;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    endcase 
                end
                9'b000000111:begin
                case(buffer_in[7:1])//110110
                    7'b1110110:begin
                        huffman_outp = 8;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1110111:begin
                        huffman_outp = 9;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111000:begin
                        huffman_outp = 10;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111001:begin
                        huffman_outp = 11;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111010:begin
                        huffman_outp = 12;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111011:begin
                        huffman_outp = 13;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111100:begin
                        huffman_outp = 14;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111101:begin
                        huffman_outp = 15;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                    7'b1111110:begin
                        huffman_outp = 16;
                        buffer_in <= {8{'z}};
                        pulser_counter <= 0;
                    end
                endcase 
            end
            9'b000001000:begin
                case (buffer_in)
                9'b11111110:begin
                    huffman_outp = 17;
                    pulser_counter <= 0;
                    buffer_in <= {8{'z}};
                end
                9'b11111111:begin
                    huffman_outp = 18;
                    pulser_counter <= 0;
                    buffer_in <= {8{'z}};
                end
                endcase 
            end
        endcase
    end
    
endmodule