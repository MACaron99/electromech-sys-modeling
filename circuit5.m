R1 = 10;
R2 = 40;
R3 = 10;
L = 1e-3;
C = 2e-4;
f = 40;
ph = 30;

E = 300 / sqrt(2) * exp(ph * pi / 180 * i);

w = 2 * pi * f;

XL = w * L;
XC = 1 / (w * C);

Z = R1 + R3 + i * XL - i * XC;

