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

I = rgb2hsv(I);
bw = poly2mask(xi, yi, rows(I), columns(I));
I = immask(I, bw);

H1 = I(:,:,1) >= 0.55;
H2 = I(:,:,1) <= 0.7;
H3 = I(:,:,2) >= 0.3;
H = H1 & H2 & H3; 

se = ones(3, 3); % initialize a simple strucural element  
B1 = imerode(H, se); 
B2 = imdilate(B1, se); 


subplot(1, 2, 2); 
imshow(B2);


