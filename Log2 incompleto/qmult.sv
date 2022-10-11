module qmult #(
	//Parameterized values
	parameter Q = 8,
	parameter N = 16
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