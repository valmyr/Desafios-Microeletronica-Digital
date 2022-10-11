module qmult #(
	//Parameterized values
	parameter Q = 16,
	parameter N = 256
	)
	(
     input logic ena,
	 input			[N-1:0]	i_multiplicand,
	 input			[N-1:0]	i_multiplier,
	 output			logic[N-1:0]	o_result,
     output logic ovr
	 );
	logic [2*N-1:0]	r_result;
    logic [N-1:0]		r_RetVal;
	always @(i_multiplicand, i_multiplier,ena)	begin						
		r_result <= ena?i_multiplicand[N-2:0] * i_multiplier[N-2:0]:0;		
        ovr <= 1'b0;																															
		end
	always @(r_result) begin													
		r_RetVal[N-1] <= i_multiplicand[N-1] ^ i_multiplier[N-1];	//		which is the XOR of the input sign bits...  (you do the truth table...)
		r_RetVal[N-2:0] <= r_result[N-2+Q:Q];								//	And we also need to push the proper N bits of result up to 
																						//		the calling entity...
		if (r_result[2*N-2:N-1+Q] > 0)										// And finally, we need to check for an overflow
			ovr <= 1'b1;
    end						
    assign o_result = ena? r_RetVal:0;	
endmodule
module log2X(input clk,
        input rst,
       input logic  [7:0] x_,
       output logic [10:0] log2_x);
    logic [3:0] exp;
    logic [7:-8] x;
    logic [127:0] mant;
    logic [4:0] log2m;
    logic y,normalizado,ena_multp;
    logic [3:0]  aprox, i;
    initial begin 
        exp = 0;
        aprox = 5;
        log2m = 0;
        y = 0;
        i = 0;
        mant = 0;
        x =0;
        normalizado = 0;
        ena_multp = 0;
    end
    always@(x) begin
        casez(x[7:0])
            8'b00000001:begin
                x = x >> 0;
                normalizado =1;
            end
            8'b0000001z:begin
                exp = 1;
                x = x >> 1;
                normalizado =1;
            end
            8'b000001zz:begin
                exp = 2;
                x = x >> 2;
                normalizado =1;
            end
            8'b00001zzz:begin
                exp = 3;
                x = x >> 3;
                normalizado =1;
            end
            8'b0001zzzz:begin
                exp = 4;
                x = x >> 4;
                normalizado =1;
            end
            8'b001zzzzz:begin
                exp = 5;
                x = x >> 5;
                normalizado =1;
            end
            8'b01zzzzzz:begin
                exp = 6;
                x = x >> 6;
                normalizado =1;
            end
            8'b1zzzzzzz:begin
                exp = 7;
                x = x >> 7;
                normalizado =1;
            end
        endcase
    end

    always@(posedge clk,posedge rst)begin
        if(rst)begin x[7:0] = x_;
            x[-1:-8] = 0;
            normalizado = 0;
        end
        else
            if(normalizado)begin
                normalizado = 0;
                mant = x_;
            end
            else begin
                if(i < aprox)begin
                    mant = (mant * mant);
                    i = i + 1;
                    ena_multp = 1;
                end
                else begin
                    ena_multp = 0;
                    if(mant[127:96] != 1)begin
                        mant = mant >> 1;
                        log2m = log2m + 1; 
                    end
                    else y = 1;
                end
            end
        end
    qmult (ena_multp,z,z,t);
   assign log2_x = (x_ == 0) ? 11'bzzzzzzzzzz: y ? {exp,log2m}:0;
endmodule