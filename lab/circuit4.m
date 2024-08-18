f = 50;
R1 = input('Input value R1 = ');
R2 = input('Input value R2 = ');
R3 = input('Input value R3 = ');
L = input('Input value L = ');
C = input('Input value C = ');

i(1) = 0;
Uc(1) = 0;

h = 0.001;

G11 = (1 / R1) + (1 / R2) + (1 / R3);
G22 = (1 / R2) + (h / L);
G33 = (1 / R3) + (C / h);
G12 = 1 / R2;
G13 = 1 / R3;
G23 = 0;
G21 = G12;
G31 = G13;
G32 = G23;

G = [G11 -G12 -G13;
     -G21 G22 -G23;
     -G31 -G32 G33];

w = 2 * pi * f;

psi = pi / 4;

t(1) = 0;

for k = 2 : 200
  t(k) = t * (k - 1) + h;

  E = 100 / sqrt(2) * sin(w * t(k) + psi);

  I11 = E / R1;
  I22 = -i2 * (k - 1);
  I33 = C * Uc * (k - 1) /h;
  
  I = [I11; I22; I33];

  Fi = G / I;

  i1(k) = E / R1 - Fi(1) / R1;
  i2(k) = (Fi(1) - Fi(2)) / R2;
  i3(k) = (Fi(1) - Fi(3)) / R3;

  Uc(k) = Fi(3);
end

plot(t, i1, t, i2, t, i3, t, Uc);

xlabel('Time');
ylabel('Current/Voltage');

legend('i1', 'i2', 'i3', 'Uc');
