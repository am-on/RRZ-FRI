pkg load image;

I = zeros(25,25) ; 
I(13,13) = 255 ;

sigma = 6.0; 
G = gauss(sigma); 
D = gaussdx(sigma);

figure();
subplot(2, 3, 1);
imshow(I);

subplot(2, 3, 2);
Ig=conv2(I, G, 'same');
Ig=conv2(Ig, G', 'same');
imagesc(Ig);

subplot(2, 3, 3);
Ig=conv2(I, G, 'same');
Ig=conv2(Ig, D', 'same');
imagesc(Ig);

subplot(2, 3, 4);
Ig=conv2(I, D, 'same');
Ig=conv2(Ig, G', 'same');
imagesc(Ig);

subplot(2, 3, 5);
Ig=conv2(I, G', 'same');
Ig=conv2(Ig, D, 'same');
imagesc(Ig);

subplot(2, 3, 6);
Ig=conv2(I, D', 'same');
Ig=conv2(Ig, G, 'same');
imagesc(Ig);
