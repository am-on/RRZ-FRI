pkg load image;

I = rgb2gray(uint8(imread('rectangle.png')) .* 255);
I2 = rgb2gray(imread('pier.jpg'));

[y, x] = harris(I); 
[y2, x2] = harris(I2); 

figure()

subplot(1, 2, 1);
imshow(I);
hold on;
  plot(x, y, 'r+', 'MarkerSize', 12, 'LineWidth', 2);
hold off;

subplot(1, 2, 2);
imshow(I2);
hold on;
  plot(x2, y2, 'r+', 'MarkerSize', 12, 'LineWidth', 2);
hold off;