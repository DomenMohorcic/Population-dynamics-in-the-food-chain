b1 = -0.1;
b2 = -0.1;
b3 = -0.1;
b4 = -0.05;
b5 = -0.05;
b6 = 0.3;
b = [b1; b2; b3; b4; b5; b6]

A = zeros(6, 6);
% napisemo raje v matriki ...
A(1, 2) = 0.5;
A(1, 3) = 0.7;
A(2, 4) = 1;
A(3, 4) = 1;
A(3, 5) = 4;
A(4, 6) = 2;
A(5, 6) = 1;

A(2, 1) = -2;
A(3, 1) = -8;
A(4, 2) = -6;
A(4, 3) = -1;
A(5, 3) = -1;
A(6, 4) = -2;
A(6, 5) = -5;

A = A .* 0.001

x = -A\b %za iskanje stacionarne resitve
% daje gibanje bliz ustacionarne tocke ... ciklicno obnasanje
% dodamo se JG(x0), da dobimo matriko B, ki nam bo povedala kaj se dogaja okoli teh tock preko lastnih vrednosti! 
x = x + randn(6, 1) * 2

%x = [8; 28; 122; 117; 13; 172];
% x = [74; 28; 12; 157; 11; 178];


simulatePopulation(x, b, A, 10000);