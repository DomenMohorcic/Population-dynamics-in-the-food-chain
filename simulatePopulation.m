function retval = simulatePopulation (x0, b, A)
  F = @(X, b, A) X.*(b+A*X);
  
  n = 1;
  h = 0.1;
  %F(x0, b, A)
  x = x0;
  for i = (1:10)
    x = x + rk4Step(F, x, h, b, A)
  endfunction retval = simulatePopulation (x0, b, A, n)
  F = @(X, b, A) X.*(b+A*X);%enacba prirastka za vsako vrsto
  h = 0.1;%dolzina koraka
  
  tocke = zeros(6, n);
  x = x0;
  
  %%Simulacija
  for i = (1:n)
    x = x + rk4Step(F, x, h, b, A);
    tocke(:, i) = x;
  end
  
  %%Plot
  hold on
  for i = (1:6)
    vektor = zeros(1, n);
    vektor(1, :) = tocke(i, :);
    plot(vektor);
  endfor
  hold off
  
  x
endfunction

%%Korak rk4
function val = rk4Step(f, x0, h, b, A)
  k1=feval(f, x0, b, A);
  k2=feval(f, x0 + k1*h/2, b, A);
  k3=feval(f, x0 + k2*h/2, b, A);
  k4=feval(f, x0 + k3*h, b, A);
  val = h*(k1+2*k2+2*k3+k4)/6;
endfunction
  
  jacobian(x, b, A);
endfunction

function [X, n] = newton(F, JF, X0, tol = 1e-10, maxit = 100)
  for n = 1:maxit
    X = X0 - feval(JF, X0)\feval(F, X0);
    if(norm(X - X0) < tol)
      break;
    end
    X0 = X;
  end
  if(n == maxit)
    warning("no convergence after maxit iterations")
  endif
endfunction

function val = rk4Step(f, x0, h, b, A)
  k1=feval(f, x0, b, A);
  k2=feval(f, x0 + k1*h/2, b, A);
  k3=feval(f, x0 + k2*h/2, b, A);
  k4=feval(f, x0 + k3*h, b, A);
  val = h*(k1+2*k2+2*k3+k4)/6;
endfunction

function val = jacobian(x, b, A)
  val = zeros(length(x))
endfunction
