`include "sobel.sv"

module tb();
logic  [10:0] Im[6:0][7:0];
logic  [10:0] sobel_[5:0][6:0];
    sobel_filter filtro_sobel_(.Imag(Im),.sobel(sobel_));
  initial begin
      Im[6][7] = 0;
      Im[6][6] = 0;
      Im[6][5] = 0;
      Im[6][4] = 0;
      Im[6][3] = 0;
      Im[6][2] = 0;
      Im[6][1] = 0;
      Im[6][0] = 0;

      Im[5][7] = 0;
      Im[5][6] = 0;
      Im[5][5] = 0;
      Im[5][4] = 0;
      Im[5][3] = 0;
      Im[5][2] = 255;
      Im[5][1] = 255;
      Im[5][0] = 255;


      Im[4][7] = 0;
      Im[4][6] = 0;
      Im[4][5] = 0;
      Im[4][4] = 0;
      Im[4][3] = 255;
      Im[4][2] = 255;
      Im[4][1] = 255;
      Im[4][0] = 255;

      Im[3][7] = 0;
      Im[3][6] = 0;
      Im[3][5] = 0;
      Im[3][4] = 255;
      Im[3][3] = 255;
      Im[3][2] = 255;
      Im[3][1] = 255;
      Im[3][0] = 0;

      Im[2][7] = 0;
      Im[2][6] = 0;
      Im[2][5] = 0;
      Im[2][4] = 255;
      Im[2][3] = 255;
      Im[2][2] = 255;
      Im[2][1] = 0;
      Im[2][0] = 0;

      Im[1][7] = 0;
      Im[1][6] = 0;
      Im[1][5] = 255;
      Im[1][4] = 255;
      Im[1][3] = 255;
      Im[1][2] = 255;
      Im[1][1] = 0;
      Im[1][0] = 0;



      Im[0][7] = 0;
      Im[0][6] = 0;
      Im[0][5] = 255;
      Im[0][4] = 255;
      Im[0][3] = 255;
      Im[0][2] = 255;
      Im[0][1] = 0;
    Im[0][0] = 0;
    
  end
    integer i = 0;
    integer j = 0;
    initial begin
          for( i = 0; i < 5; i++)begin
              for(j = 0; j < 6; j++)begin
        #2$display("%d ",sobel_[i][j]);
      end
        $display("\n\n\n");
    end
    
  end

endmodule