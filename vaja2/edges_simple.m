function [Ie] = edges_simple(I, theta)
  [Imag, Idir] = gradient_magnitude(I, 1);
  Ie = Imag > theta;
end