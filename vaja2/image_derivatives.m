function [Ix, Iy] = image_derivatives(I, sigma)
  g = gauss(sigma);
  gdx = gaussdx(sigma);
  x_filter = conv(g', gdx, 'same');
  y_filter = conv(g, gdx', 'same');
  Ix = conv2(I, x_filter, 'same');
  Iy = conv2(I, y_filter, 'same');  
end