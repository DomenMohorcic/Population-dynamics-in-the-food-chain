function [x, b, A] = generateSystem(coefB, coefA)
  A = zeros(6, 6);
  b = zeros(6, 1);
  mask = [0 1 1 0 0 0;1 0 0 1 0 0;1 0 0 1 1 0;0 1 1 0 0 1;0 0 1 0 0 1;0 0 0 1 1 0];
  
  while 1
    #zgornje trikoten pozitiven del
    for i = 1:6
      for j = i:6
        A(i, j) = rand * coefA;
      endfor
    endfor
    #spodnje trikoten negativen del
    for i = 1:6
      for j = 1:i
        A(i, j) = -rand * coefA;
      endfor
    endfor
    #maska
    A = A.*mask;
    #b
    for i = 1:5
      b(i) = -rand*coefB;
    endfor
    b(6) = rand*coefB;
    #preveri ce je resitev ustrezna
    x = A\b;
    s_gt = sum(x <= 0);
    s_lt = sum(x >= 0);
    if s_gt == 0
      break;
    elseif s_lt == 0
      x = -x;
      break;
    endif
  endwhile
  eigValuesB(x, b, A)
endfunction
