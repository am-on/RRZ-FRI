function Ib = gaussfilter(I, sigma) 
  g = gauss(sigma);
  Ib = conv2(I, g, 'same');
  Ib = conv2(Ib, g', 'same');
end  