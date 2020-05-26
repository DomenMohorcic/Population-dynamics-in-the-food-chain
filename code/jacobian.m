function val = jacobian(x, b, A)
  len = length(x);
  val = zeros(len, len);
  
  for col = (1:len)
    for row = (1:len)
      if(col != row)
        val(col, row) = A(col, row)*x(col);
      else
        val(col, row) = b(row);
        for i = 1:len
          if(row != i)
            val(col, row) = val(col, row) + A(row, i)*x(i);
          endif
        endfor
      endif
    end 
  end

  jacobian = val;

##  val = zeros(6, 6)
##  val = [ 
##       b(1) + A(1,2) * x(2) + A(1,3) * x(3), A(1,2)*x(1), A(1,3)*x(1),  0,  0, 0;
##      A(2,1)*x(2),   b(2) + A(2,1) * x(1) + A(2,4) * x(4),   0,  A(2,4)*x(2),  0, 0;
##      A(3,1)*x(3),   0,   b(3) + A(3,1) * x(1) + A(3,4) * x(4) + A(3,5)*x(5),  A(3,4)*x(3),  A(3,5)*x(3), 0;
##       0,  A(4,2)*x(4),  A(4,3)*x(4),  b(4) + A(4,2) * x(2) + A(4,3) * x(3) + A(4,6)*x(6),  0, A(4,6)*x(4);
##       0,   0,  A(5,3) * x(5),  0,  b(5) + A(5,3) * x(3) + A(5,6) * x(6), A(5,6)*x(5);
##       0,   0,   0, A(6,4) * x(6), A(6,5)*x(6), b(6) + A(6,4) * x(4) + A(6,5) * x(5);
##    ]
##    
##  val
  
endfunction