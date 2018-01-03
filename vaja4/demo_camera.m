camera = camera_create('192.168.1.10'); % Create camera handle
image = camera_image(camera); % Retrieve current image
homography = camera_position(camera); % Retrieve current homoraphy

figure(1);
imshow(image); % Display image
hold on;
% TODO: draw points here
hold off;



