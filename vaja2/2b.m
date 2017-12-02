pkg load image;

I = rgb2gray(imread('museum.jpg')); 
[Imag, Idir] = gradient_magnitude(I, 1);

Ie = edges_simple(I, 50);

figure();
colormap(gray);
subplot(2, 3, 1);
imagesc(I);

subplot(2, 3, 2);
imagesc(Ie);

Ie = edges_simple(I, 80);
subplot(2, 3, 3);
imagesc(Ie);

Ie = edges_simple(I, 100);
subplot(2, 3, 4);
imagesc(Ie);

Ie = edges_simple(I, 120);
subplot(2, 3, 5);
imagesc(Ie);

Ie = edges_simple(I, 150);
subplot(2, 3, 6);
imagesc(Ie);
