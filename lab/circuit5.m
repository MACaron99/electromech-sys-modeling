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

i1 = E / Z;

iLM = abs(i1);
iLA = angle(i1);

i1(1) = iLM * sin(iLA);

Uc(1) = 300 / sqrt(2);

h = 0.001;

G11 = (1 / R2) + (1 / R3) + (h / L);
G22 = (1 / R3) + (C / h);
G33 = (1 / R1) + (1 / R2) + (C / h);
G12 = 1 / R3;
G13 = 1 / R2;
G23 = 0;
G21 = G12;
G31 = G13;
G32 = G23;

G = [G11 -G12 -G13;
     -G21 G22 -G23;
     -G31 -G32 G33];

t(1) = 0;

for k = 2 : 200
  t(k) = t * (k - 1) + h;

  E = 300 / sqrt(2) * sin(w * t(k) + pi / 6);

  I11 = -i1 * (k - 1);
  I22 = C * Uc * (k - 1) / h;
  I33 = (E / R1) - I22;
  
  I = [I11; I22; I33];

  Fi = G / I;

  i1(k) = E / R1 - Fi(1) / R1;
  i2(k) = (Fi(1) - Fi(3)) / R2;
  i3(k) = (Fi(1) - Fi(2)) / R3;

  Uc(k) = Fi(2);
end

subplot(2, 1, 1);
plot(t, i1, t, i2, t, i3);

xlabel('Time');
ylabel('Current');
legend('i1', 'i2', 'i3');

subplot(2, 1, 2);
plot(t, Uc);

xlabel('Time');
ylabel('Voltage');
legend('Uc');
