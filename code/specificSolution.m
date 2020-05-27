function RES = specificSolution(coefA, coefB, realVal)
    A = [ 
         0,  1,  1,  0,  0,  0;
        -1,  0,  0,  1,  0,  0;
        -1,  0,  0,  1,  1,  0;
         0, -1, -1,  0,  0,  1;
         0,  0, -1,  0,  0,  1;
         0,  0,  0, -1, -1,  0;
      ];
      
  b = [ -1; -1; -1; -1; -1; 1];
  
  BEST = A;
  best = b;
  bestNum = 1000000;
  
  % 1st gen
  M = cell(100, 1);
  m = cell(100, 1);
  
  % values
  v = zeros(100, 1);
  
  for i = (1 : 100)
    % random matrix A
    R = randn(6, 6) * 2 * coefA;
    R = abs(R);
    
    % random vector b
    r = randn(6, 1) * 2 * coefB;
    r = abs(r);
  
    % save b and A
    M{i} = round((R .* A) * 10000000) / 10000000;
    m{i} = round((r .* b) * 10000000) / 10000000;
    
    % get matrix B and the real part of its eigenvalues
    x0 = -M{i}\m{i};
    rv = real(eigValuesB(x0, b, A));
    
    % calculate euclidian distance between wanted and random point
    euclid = sqrt(sum((rv - realVal).^2));
    if (min(x0) >= 1) 
      v(i) = euclid;
    else
      v(i) = 1000000;
    endif
    
  endfor

  % other gen
  N = cell(100, 1);
  n = cell(100, 1);
  
  % values
  u = zeros(100, 1);
  
  % set vealues that will be tweaked further
  bT = m{1};
  AT = M{1};
  
  for g = 1 : 100
    v;
    [num, idx] = min(v);
    if (bestNum > num)
      bestNum = num;
      BEST = M{idx};
      best = m{idx};
      x0 = -BEST\best;
      rv = real(eigValuesB(x0, best, BEST));
    endif
    
    for i = 1 : 100
      if (mod(i, 10) == 1)
        [minimum, index] = min(v);
        if (minimum == 1000000)
          bT = best;
          AT = BEST;
        endif
        bT = m{index};
        AT = M{index};
        v(index) = 1000000;
      endif
##      elseif (i <= 10)
##        bT = best;
##        AT = BEST;
##      endif
      
      % random matrix A
      R = AT + (randn(6, 6) * coefA * 0.1);
      R = abs(R);
      
      % random vector b
      r = bT + (randn(6, 1) * coefB * 0.1);
      r = abs(r);
      
      % save b and A
      
      N{i} = round((R .* A) * 10000000) / 10000000;
      n{i} = round((r .* b) * 10000000) / 10000000;
      
      % get matrix B and the real part of its eigenvalues
      x0 = -N{i}\n{i};
      rv = real(eigValuesB(x0, b, A));
      
      % euclid
      euclid = sqrt(sum((rv - realVal).^2));
      if (min(x0) >= 1)
        u(i) = euclid;
      else
        u(i) = 1000000;
      endif
      
    endfor
    
    % reset generation
    v = u;
    M = N;
    m = n;
    
  endfor
  
  RES = writeReturn(best, BEST);
  
endfunction


function res = writeReturn(b, A) 
  res = zeros(6, 7);
  for i = (1 : 6)
    res(:, i) = A(:, i);
  endfor
  res(:, 7) = b;
endfunction
