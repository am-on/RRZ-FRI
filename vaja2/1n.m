pkg load image;

I = rgb2gray(imread('pier.jpg')); 
[Ix, Iy] = image_derivatives(I, 0.5);

figure();
colormap(gray);
subplot(1, 3, 1);
imagesc(I);

subplot(1, 3, 2);
imagesc(Ix);

subplot(1, 3, 3);
imagesc(Iy);
