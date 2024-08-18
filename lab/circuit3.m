f = 50;
R1 = input('Input value R1 = ');
R2 = input('Input value R2 = ');
R3 = input('Input value R3 = ');
L2 = input('Input value L2 = ');
C3 = input('Input value C3 = ');
ph1 = input('Input value ph1 = ');
ph2 = input('Input value ph2 = ');

XL = 2 * pi * f * L2;
XC = 1 / (2 * pi * f * C3);

E1 = 100 / sqrt(2) * exp(ph1 * pi / 180 * i);
E2 = 200 / sqrt(2) * exp(ph2 * pi / 180 * i);

Z1 = 1;
Z2 = R2 + i * XL;
Z3 = R3 - i * XC;

M = [1 -1 -1;
     Z1 0 Z3;
     0 Z2 -Z3];

F = [0; E1; -E2];

I = M / F;

disp(['I1 = ', num2str(I(1,1))]);
disp(['I2 = ', num2str(I(2,1))]);
disp(['I3 = ', num2str(I(3,1))]);

eps1 = I(1,1) - I(2,1) - I(3,1);
eps2 = E1 - E2 - Z1 * I(1,1) - Z2 * I(2,1);

disp(['Error calculation eps1 = ', num2str(eps1)]);
disp(['Error calculation eps2 = ', num2str(eps2)]);

I1M = abs(I(1,1));
I2M = abs(I(2,1));
I3M = abs(I(3,1));

phI1 = angle(I(1,1));
phI2 = angle(I(2,1));
phI3 = angle(I(3,1));

disp(['I1M = ', num2str(I1M)]);
disp(['I2M = ', num2str(I2M)]);
disp(['I3M = ', num2str(I3M)]);

disp(['phI1 = ', num2str(phI1)]);
disp(['phI2 = ', num2str(phI2)]);
disp(['phI3 = ', num2str(phI3)]);

h = 0.04 / 200;

t(1) = 0;

i(1) = current(I1M, f, phI1, t(1));
i(2) = current(I2M, f, phI2, t(1));
i(3) = current(I3M, f, phI3, t(1));

for k = 2 : 201
  t(k) = t * (k - 1) + h;
  i1(k) = current(I1M, f, phI1, t(k));
  i2(k) = current(I2M, f, phI2, t(k));
  i3(k) = current(I3M, f, phI3, t(k));
end

plot(t, i1, t, i2, t, i3);
