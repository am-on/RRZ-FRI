pkg load image

I = imread('regions_noise.png') > 127; 
se = ones(3, 3); % initialize a simple strucural element 
A1 = imdilate(I, se);

A2 = imerode(A1, se); 
B1 = imerode(I, se); 
B2 = imdilate(B1, se); 

figure(1); 
subplot(2, 3, 1); 
imshow(I); 

subplot(2, 3, 2); 
imshow(A1); 

subplot(2, 3, 3); 
imshow(A2); 

subplot(2, 3, 5); 
imshow(B1); 

subplot(2, 3, 6); 
imshow(B2);