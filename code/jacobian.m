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
endfunction