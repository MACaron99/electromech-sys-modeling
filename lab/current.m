function im = current(IM, f, phI, t)
  im = sqrt(2) * IM * sin(2 * pi * f * t + phI);
