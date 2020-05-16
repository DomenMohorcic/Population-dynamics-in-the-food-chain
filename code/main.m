##b1 = -0.1;
##b2 = -0.1;
##b3 = -0.1;
##b4 = -0.05;
##b5 = -0.05;
##b6 = 0.3;
##b = [b1; b2; b3; b4; b5; b6]
##
A = zeros(6, 6);
% napisemo raje v matriki ...
##A(1, 2) = 0.5;
##A(1, 3) = 0.7;
##A(2, 4) = 1;
##A(3, 4) = 1;
##A(3, 5) = 4;
##A(4, 6) = 2;
##A(5, 6) = 1;
##
##A(2, 1) = -2;
##A(3, 1) = -8;
##A(4, 2) = -6;
##A(4, 3) = -1;
##A(5, 3) = -1;
##A(6, 4) = -2;
##A(6, 5) = -5;

##A = [ 
##     0, 0.5, 0.7,  0,  0, 0;
##    -2,   0,   0,  1,  0, 0;
##    -8,   0,   0,  1,  4, 0;
##     0,  -6,  -1,  0,  0, 2;
##     0,   0,  -1,  0,  0, 1;
##     0,   0,   0, -2, -5, 0;
##  ]

##A = A .* 0.001

## res = generateMatrix(10000, 0, 0.001, 0.05);
% realVal = [-30; -10; -35; -30; -30; -30];
realVal = [0; 0; 0; 0; 0; 0];
res = specificSolution(0.01, 0.5, realVal);

for i = (1 : 6)
  A(:, i) = res(:, i);
endfor
b = res(:, 7);

A
b

x0 = -A\b %za iskanje stacionarne resitve
% simulatePopulation(x0, b, A, 10000);
% daje gibanje bliz ustacionarne tocke ... ciklicno obnasanje
% dodamo se JG(x0), da dobimo matriko B, ki nam bo povedala kaj se dogaja okoli teh tock preko lastnih vrednosti! 
x = x0 + randn(6, 1) * 2;

ev = real(eigValuesB(x0, b, A))
%x = [8; 28; 122; 117; 13; 172];
% x = [74; 28; 12; 157; 11; 178];

% simulate population and plot it
simulatePopulation(x, b, A, 10000);