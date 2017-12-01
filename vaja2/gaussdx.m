function g = gaussdx(sigma)
  x = -round(3.0*sigma):round(3.0*sigma);
  g = ((-1 / sqrt(2 * pi * sigma^3)) .* x) .^ (-1*(x .^ 2) / (2 * sigma^2));
  
  g = (-(1 / sqrt(2*pi*sigma^3)) .* x) .^ ((-x .^ 2) ./ (2 * sigma^2));
  
  g = g / sum(g) ; % normalization
  
end  