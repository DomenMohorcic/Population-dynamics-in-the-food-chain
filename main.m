b1 = -0.2;
b2 = -0.1;
b3 = -0.1;
b4 = -0.05;
b5 = -0.05;
b6 = 0.3;
b = [b1; b2; b3; b4; b5; b6]

A = zeros(6, 6);
A(1, 2) = 0.001;
A(1, 3) = 0.001;
A(2, 4) = 0.002;
A(3, 4) = 0.002;
A(3, 5) = 0.002;
A(4, 6) = 0.008;
A(5, 6) = 0.008;

A(2, 1) = -0.003;
A(3, 1) = -0.002;
A(4, 2) = -0.001;
A(4, 3) = -0.005;
A(5, 3) = -0.004;
A(6, 4) = -0.004;
A(6, 5) = -0.002;

A

x = -A\b