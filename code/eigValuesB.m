function EV = eigValuesB(x, b, A)
  % interpretiramo se dogajanje okoli stacionarne tocke z matriko B in njenimi lastnimi vrednostmi
  B = jacobian(x, b, A);
  [V, N] = eig(B);
  % get eigenvalues
  ev = zeros(6, 1);
  for i = (1 : 6)
    ev(i) = N(i, i);
  end
  
  EV = ev;  
endfunction
