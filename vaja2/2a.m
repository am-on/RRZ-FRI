pkg load image;

I = rgb2gray(imread('museum.jpg')); 
[Imag, Idir] = gradient_magnitude(I, 1);

figure();
colormap(gray);
subplot(1, 3, 1);
imagesc(I);

subplot(1, 3, 2);
imagesc(Imag);

subplot(1, 3, 3);
imagesc(Idir);
