% by blue
I = imread('trucks.jpg'); 
figure(1); 

subplot(2,2,1);
imshow(I);

% by normalized RGB blue
dI = double(imread('trucks.jpg')); 

suma = sum(dI, 3);
BLUE = dI(:,:,3) ./ suma;
BLUE = BLUE > 0.42;

subplot(2,2,2);
imshow(BLUE);


function img = immask(rgb, bin)  
  R = rgb(:, :, 1);
  R(bin ~= 1) = 0;
  
  G = rgb(:, :, 2);
  G(bin ~= 1) = 0;
  
  B = rgb(:, :, 3);
  B(bin ~= 1) = 0;
  
  img = cat(3, R, G, B);
end

subplot(2,2,4);
imshow(immask(I,BLUE))