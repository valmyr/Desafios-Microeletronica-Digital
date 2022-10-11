`include"./qmult.sv"
module l#(
	//Parameterized values
	parameter Q = 15,
	parameter N = 64
	)
	(
	 input			[N-1:0]	i_multiplicand,
	 input			[N-1:0]	i_multiplier,
	 output			[N-1:0]	o_result,
	 output	reg				ovr
	 );

    always@(*)
        qmult s(i_multiplicand,i_multiplier,o_result,ovr);
endmodule