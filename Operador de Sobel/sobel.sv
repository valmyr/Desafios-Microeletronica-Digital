module sobel_filter(input  logic  [10:0] Imag[6:0][7:0],
                    output logic  [10:0] sobel[5:0][6:0]
                    );

    logic [7:0] Gx[2:0][2:0], Gy[2:0][2:0];
    initial begin
      Gx[2][2] = -1;
      Gx[2][1] = 0;
      Gx[2][0] = 1;
      Gx[1][2] = -2;
      Gx[1][1] = 0;
      Gx[1][0] = 2;
      Gx[0][2] = -1;
        Gx[0][1] = 0;
      Gx[0][0] = 1;

      Gy[2][2] = 1;
      Gy[2][1] = 2;
      Gy[2][0] = 1;
      Gy[1][2] = 0;
      Gy[1][1] = 0;
      Gy[1][0] = 0;
      Gy[0][2] = -1;
      Gy[0][1] = -2;
      Gy[0][0] = -1;
 

    end
    generate 
       genvar i,j;
      for(i = 0; i < 5; i++)begin:length_
        for( j =0 ; j < 6; j++)begin: width_
          assign sobel[i][j] =	Gx[0][0]*Imag[0+i][0+j] + 
                                            Gx[0][1]*Imag[0+i][1+j] + 
                                            Gx[0][2]*Imag[0+i][2+j] +
                                            Gx[1][0]*Imag[1+i][0+j] + 
                                            Gx[1][1]*Imag[1+i][1+j] + 
                                            Gx[1][2]*Imag[1+i][2+j] +
                                            Gx[2][0]*Imag[2+i][0+j] +
                                            Gx[2][1]*Imag[2+i][1+j] +
                                            Gx[2][2]*Imag[2+i][2+j] ;
//                                             Gy[0][0]*Imag[0+i][0+j] + 
//                                             Gy[0][1]*Imag[0+i][1+j] + 
//                                             Gy[0][2]*Imag[0+i][2+j] +
//                                             Gy[1][0]*Imag[1+i][0+j] + 
//                                             Gy[1][1]*Imag[1+i][1+j] + 
//                                             Gy[1][2]*Imag[1+i][2+j] +
//                                             Gy[2][0]*Imag[2+i][0+j] +
//                                             Gy[2][1]*Imag[2+i][1+j] +
//                                             Gy[2][2]*Imag[2+i][2+j];
                end
        end
    endgenerate

endmodule