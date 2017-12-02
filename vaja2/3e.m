pkg load image;

I = imread('pier.jpg'); 
Ig = rgb2gray(I);
Ie = edge(Ig, "Canny", 0.6);

I2 = imread('bricks.jpg'); 
I2g = rgb2gray(I2);
Ie2 = edge(I2g, "Canny", 0.6);

[rho, theta] = hough_find_lines(Ie, "threshold", 100, "neighborhood", 20);
[rho2, theta2] = hough_find_lines(Ie2, "threshold", 170, "neighborhood", 10);

figure();
subplot(1,2,1);
hough_draw_lines(I, rho, theta);

subplot(1,2,2);
hough_draw_lines(I2, rho2, theta2);




