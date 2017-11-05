% by blue
I = imread('trucks.jpg'); 
figure(1); 

subplot(2,2,1);
imshow(I);

BLUE = I(:,:,3) > 200;

subplot(2,2,2);
imshow(BLUE);

% by normalized RGB blue
I = double(imread('trucks.jpg')); 

suma = sum(I, 3);
BLUE = I(:,:,3) ./ suma;
BLUE = BLUE > 0.42;

subplot(2,2,3);
imshow(BLUE);

% by HSV

%I = ones(20, 255, 3); 
%I(:, :, 1) = ones(20, 1) * linspace(0, 1, 255); 
%image([0, 1], [0, 1], hsv2rgb(I));

I2 = rgb2hsv(I);
H1 = I2(:,:,1) >= 0.52;
H2 = I2(:,:,1) <= 0.58;
H = H1 & H2;

subplot(2,2,4);
imshow(H);