pkg load image;

I = imread('eclipse.jpg'); 
Ig = rgb2gray(I);
Ie = edge(Ig, "Canny", 0.15);

I2 = imread('coins.jpg'); 
I2g = rgb2gray(I2);
Ie2 = edge(I2g, "Canny", 0.5);

[x, y, r] = hough_find_circles(Ie, 48, "threshold", 25, "neighborhood", 4);
[x2, y2, r2] = hough_find_circles(Ie2, 88, "threshold", 50, "neighborhood", 10);

figure();
subplot(1,2,1);
hough_draw_circles(I, x, y, r);

subplot(1,2,2);
hough_draw_circles(I2, x2, y2, r2);
