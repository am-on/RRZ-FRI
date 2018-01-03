pkg load image;

function img = immask(rgb, bin)  
  R = rgb(:, :, 1);
  R(bin ~= 1) = 0;
  
  G = rgb(:, :, 2);
  G(bin ~= 1) = 0;
  
  B = rgb(:, :, 3);
  B(bin ~= 1) = 0;
  
  img = cat(3, R, G, B);
end

I = imread("camera2.jpg");
n = 4;

subplot(1, 2, 1); 
imshow(I);
[xi, yi] = ginput (n);
hold on
for i = 1:n
  plot(xi(i), yi(i), "marker", "x", "color", 'b', "markersize", 20); 
end
hold off

subplot(1, 3, 3); 
bw = poly2mask(xi, yi, rows(I), columns(I));
imshow(immask(I, bw));






