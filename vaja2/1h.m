pkg load image

I = rgb2gray(imread('museum.jpg')); 

k1 = zeros(3,3);
k1(2,2) = 2;
k2 = (1/9) .* ones(3,3);
k = k1 .- k2;
Ib = conv2(I, k, 'same');

figure;
subplot(1,2,1);
imshow(I);   
subplot(1,2,2);  
imshow(uint8(Ib)); 

