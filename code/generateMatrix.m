% n - number of iterations
% w - 0 --> zeros for the real part of eigenvalues
%     1 --> positive numbers for the real part of eigenvalues
%    -1 --> negative numbers for the real part of eigenvalues
%     2 --> caos (hopefully)

function res = generateMatrix(n, w, coefA, coefB)
  
  A = [ 
        0, 1, 1, 0, 0, 0;
        -1, 0, 0, 1, 0, 0;
        -1, 0, 0, 1, 1, 0;
        0, -1, 1, 0, 0, 1;
        0, 0, -1, 0, 0, 1;
        0, 0, 0, -1, -1, 0;
      ];
      
  b = [ -1; -1; -1; -1; -1; 1];
  
  M = cell(n, 1);
  m = cell(n, 1);
  c = zeros(n, 1);
  index = 0;
  for i = (1 : n)
    R = randn(6, 6) * 2;
    R = abs(R) * coefA;
    
    r = randn(6, 1) * coefB;
    r = abs(r);
  
    M{i} = R .* A;
    m{i} = r .* b;
    
    c(i) = check(m{i}, M{i}, w);
    
    if (c(i) == 6)
      index = i;
      break;
    endif
    
  endfor
  best = logical(round(c / 6));
  %A = M(best){1};
  %b = m(best){1};
  A = M{index + 1};
  b = m{index + 1};
  
  res = zeros(6, 7);
  for i = (1 : 6) 
    res(:, i) = A(:, i);
  endfor
  res(:, 7) = b;
  
endfunction

function c = check(b, A, w)
  points = 0;
  x0 = -A\b;
  B = eigValuesB(x0, b, A);
  if (min(x0) > 0)
    points = points + 3;
  endif
  
  r = real(B);
  
  if (w == 1 && min(r) > 0.01)
    points = points + 2;
  elseif (w == -1 && max(r) < -0.01)
    points = points + 2;
  elseif (w == 0 && all(r < 1e-15))
    points = points + 2;
  elseif (w == 2 && (rand(1) < 0.1 || (max(r) > 0 && min(r) < 0)))
    points = points + 2;
  endif
  
  if (max(x0) < 200)
    points = points + 1;
  endif
  
  c = points;
endfunction

function print(b, A) 
  x0 = -A\b
  real(eigValuesB(x0, b, A))
endfunction
