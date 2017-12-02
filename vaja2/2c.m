pkg load image;

I = rgb2gray(imread('pier.jpg')); 


figure();
subplot(2, 3, 1);
imshow(I);

subplot(2, 3, 2);
imagesc(edge(I, "Canny"));

subplot(2, 3, 3);
imagesc(edge(I, "Prewitt"));

subplot(2, 3, 4);
imagesc(edges_simple(I, 50));

subplot(2, 3, 5);
imagesc(edge(I, "Roberts"));

subplot(2, 3, 6);
imagesc(edge(I, "Sobel"));
