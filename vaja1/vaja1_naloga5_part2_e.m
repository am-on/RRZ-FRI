pkg load image
figure(1); 

I = imread('bird.jpg'); 
subplot(1,4,1);
imshow(I);

I = rgb2gray(I); 
% histogram
P = I(:);
bins = 256; 
H = hist(P, bins); 
subplot(1,4,2); 
bar(H, 'b'); 

% image
I = I > 51;
subplot(1,4,3);
imshow(I);

se = ones(12, 12);
C1 = imclose(I, se);
subplot(1,4,4);
imshow(C1);


