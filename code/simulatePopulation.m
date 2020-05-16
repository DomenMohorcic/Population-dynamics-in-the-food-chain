function retval = simulatePopulation (x0, b, A, n, fig)
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
  figure(fig)
  hold on
  for i = (1:6)
    vektor = zeros(1, n);
    vektor(1, :) = tocke(i, :);
    plot(vektor);
  endfor
  hold off
  
##  for i = (1 : 5)
##    figure(i + 1)
##    plot(tocke(6, :), tocke(i, :));
##    % colormap(jet);
##  endfor
  
  lastX = x  
  
endfunction

%%Korak rk4
function val = rk4Step(f, x0, h, b, A)
  k1=feval(f, x0, b, A);
  k2=feval(f, x0 + k1*h/2, b, A);
  k3=feval(f, x0 + k2*h/2, b, A);
  k4=feval(f, x0 + k3*h, b, A);
  val = h*(k1+2*k2+2*k3+k4)/6;
endfunction