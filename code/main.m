##b1 = -0.0824046;
##b2 = -0.0059820;
##b3 = -0.0192474;
##b4 = -0.0311698;
##b5 = -0.0448382;
##b6 = 0.0549130;
##b = [b1; b2; b3; b4; b5; b6]
##
A = zeros(6, 6);
% napisemo raje v matriki ...
##A(1, 2) = 0.0041790;
##A(1, 3) = 0.0014199;
##A(2, 4) = 0.0038366;
##A(3, 4) = 0.0031243;
##A(3, 5) = 0.0038874;
##A(4, 6) = 0.0053580;
##A(5, 6) = 0.0059388;
##
##A(2, 1) = -0.0010902;
##A(3, 1) = -0.0019610;
##A(4, 2) = -0.0022909;
##A(4, 3) = 0.0029800;
##A(5, 3) = -0.0032865;
##A(6, 4) = -0.0028531;
##A(6, 5) = -0.0031236;

##A = [ 
##     0, 0.5, 0.7,  0,  0, 0;
##    -2,   0,   0,  1,  0, 0;
##    -8,   0,   0,  1,  4, 0;
##     0,  -6,  -1,  0,  0, 2;
##     0,   0,  -1,  0,  0, 1;
##     0,   0,   0, -2, -5, 0;
##  ]

A = A .* 0.001;

% res = generateMatrix(10000, 0, 0.001, 0.05);
realVal = [-30; -1; -30; -30; -3; -30];
% realVal = [0; 0; 0; 0; 0; 0];
res = specificSolution(0.01, 0.5, realVal);

for i = (1 : 6)
  A(:, i) = res(:, i);
endfor
b = res(:, 7);

A
b

x0 = -A\b %za iskanje stacionarne resitve
#simulatePopulation(x0, b, A, 10000);
% daje gibanje bliz ustacionarne tocke ... ciklicno obnasanje
% dodamo se JG(x0), da dobimo matriko B, ki nam bo povedala kaj se dogaja okoli teh tock preko lastnih vrednosti! 
%x = x0 + randn(6, 1) * min(x0)*0.2;
x = x0 + randn(6, 1) * 10

eigenval = real(eigValuesB(x0, b, A))
%x = [8; 28; 122; 117; 13; 172];
% x = [74; 28; 12; 157; 11; 178];

% simulate population and plot it
simulatePopulation(x, b, A, 10000, 1);

##for i = (2 : 10)
##  x = x0 + randn(6, 1) * min(x0) * i * 0.1;
##  simulatePopulation(x, b, A, 10000, i);
##endfor
