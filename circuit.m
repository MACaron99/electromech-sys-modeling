f = 50;
R1 = input('Input value R1 = ');
R2 = input('Input value R2 = ');
R3 = input('Input value R3 = ');
R4 = input('Input value R4 = ');
R5 = input('Input value R5 = ');
L2 = input('Input value L2 = ');
C3 = input('Input value C3 = ');
ph = input('Input value ph = ');

XL2 = 2 * pi * f * L2;
XC3 = 1 / (2 * pi * f * C3);

E1 = 100 / sqrt(2) * exp(ph * pi / 180 * i);

Z1 = R1;
Z2 = R2 + i * XL2;
Z3 = R3 - i * XC3;
Z4 = R4;
Z5 = R5;

M = [1 -1 -1 -1 0;
     0 1 1 0 -1;
     Z1 Z2 0 0 Z5;
     Z1 0 0 Z4 0;
     0 Z2 -Z3 0 0];

F = [0; 0; E1; E1; 0];

I = M / F;

disp(['I1 = ', num2str(I(1,1))]);
disp(['I2 = ', num2str(I(2,1))]);
disp(['I3 = ', num2str(I(3,1))]);
disp(['I4 = ', num2str(I(4,1))]);
disp(['I5 = ', num2str(I(5,1))]);

eps1 = I(1,1) - I(2,1) - I(3,1) - I(4,1);
eps2 = I(2,1) + I(3,1) - I(5,1);
eps3 = E1 - Z1 * I(1,1) - Z2 * I(2,1) - Z5 * I(5,1);

disp(['Error calculation eps1 = ', num2str(eps1)]);
disp(['Error calculation eps2 = ', num2str(eps2)]);
disp(['Error calculation eps3 = ', num2str(eps3)]);

I1M = abs(I(1,1));
I2M = abs(I(2,1));
I3M = abs(I(3,1));
I4M = abs(I(4,1));
I5M = abs(I(5,1));

disp(['I1M = ', num2str(I1M)]);
disp(['I2M = ', num2str(I2M)]);
disp(['I3M = ', num2str(I3M)]);
disp(['I4M = ', num2str(I4M)]);
disp(['I5M = ', num2str(I5M)]);

phI1 = angle(I(1,1));
phI2 = angle(I(2,1));
phI3 = angle(I(3,1));
phI4 = angle(I(4,1));
phI5 = angle(I(5,1));

disp(['phI1 = ', num2str(phI1)]);
disp(['phI2 = ', num2str(phI2)]);
disp(['phI3 = ', num2str(phI3)]);
disp(['phI4 = ', num2str(phI4)]);
disp(['phI5 = ', num2str(phI5)]);

h = 0.04 / 200;

t(1) = 0;

i(1) = current(I1M, f, phI1, t(1));
i(2) = current(I2M, f, phI2, t(1));
i(3) = current(I3M, f, phI3, t(1));
i(4) = current(I4M, f, phI4, t(1));
i(5) = current(I5M, f, phI5, t(1));

for k = 2 : 201
  t(k) = t * (k - 1) + h;
  i1(k) = current(I1M, f, phI1, t(k));
  i2(k) = current(I2M, f, phI2, t(k));
  i3(k) = current(I3M, f, phI3, t(k));
  i4(k) = current(I4M, f, phI4, t(k));
  i5(k) = current(I5M, f, phI5, t(k));
end

plot(t, i1, t, i2, t, i3, t, i4, t, i5);
