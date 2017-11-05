% hist demo %
pkg load image;
I = double(rgb2gray(imread('umbrellas.jpg'))); 
P = I(:); % A handy way to turn 2D matrix into a vector of numbers 
figure(1); clf; 

bins = 10 ; 
H = hist(P, bins); 
subplot(1,3,1); bar(H, 'b'); 

bins = 20 ; 
H = hist(P, bins); 
subplot(1,3,2); bar(H, 'b'); 

bins = 40 ; 
H = hist(P, bins); 
subplot(1,3,3); bar(H, 'b');

% hist stretch %
function I = histstretch ( I )
  % 1. determine the minimum and maximum value of I 
  % 2. the minimum and maximum of the output image S are known 
  % 3. use the stretch formula to compute new value for each pixel
  max_v = max( I(:) );
  min_v = min( I(:) );
  range = max_v - min_v;
  
  I = arrayfun (@(x) (x - min_v) / range * 255, I);  
endfunction

I = double(imread('phone.jpg')); 
P = I(:);
S = histstretch( I ); 

figure(2); clf; 
bins = 255; 

% before
H = hist(P, bins); 
subplot(2,2,1); bar(H, 'b'); 
subplot(2,2,2); imshow(uint8(I)); 

% after
H = hist(S(:), bins); 
subplot(2,2,3); bar(H, 'b'); 
subplot(2,2,4); imshow(uint8(S)); 

% black white %
I = double(imread('phone.jpg')); 
P = I(:);
BW = im2bw(imread('phone.jpg'));

figure(3); clf; 
bins = 255; 

% original image
subplot(1,3,1); imshow(uint8(I)); 

% hist of image
H = hist(P, bins); 
subplot(1,3,2); bar(H, 'b');
 
% auto bw image
subplot(1,3,3); imshow(BW); 
