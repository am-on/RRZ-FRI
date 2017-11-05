I1 = imread('trucks.jpg'); 
figure(1); 
hold on; 

colormap gray; 
subplot(2, 4, 1); 
imshow(I1); 
% Draw RGB channels as separate subplots 

% red
subplot(2, 4, 2); 
imshow(I1(:,:,1)); 

% green
subplot(2, 4, 3); 
imshow(I1(:,:,2)); 

% blue
subplot(2, 4, 4); 
imshow(I1(:,:,3)); 


% Draw HSV channels as separate subplots 
I2 = rgb2hsv(I1); 

% hue
subplot(2, 4, 5); 
imshow(I2(:,:,1)); 

% saturation
subplot(2, 4, 6); 
imshow(I2(:,:,2)); 

% value
subplot(2, 4, 7); 
imshow(I2(:,:,3)); 


hold off;