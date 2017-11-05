pkg load image

function [moment] = moment(R, p, q)
  [row,col] = find(R);
  p_moment = row .^ p;
  q_moment = col .^ q;
  moment = sum(p_moment .* q_moment);
end

I = imread('trucks.jpg'); 
figure(1); 
subplot(2,2,1);
imshow(I);

% get yellow color
I2 = rgb2hsv(I);
H1 = I2(:,:,1) >= 0.09;
H2 = I2(:,:,1) <= 0.18;
H = H1 & H2;

% plot yellow only
subplot(2,2,2);
imshow(H);

% morphologic operations
se = ones(3, 3); % initialize a simple strucural element 
C1 = imclose(H, se);
C1 = imopen(C1, se);

subplot(2,2,3);
imshow(C1); 

% label regions
labeled = bwlabel(C1);
subplot(2,2,4);
imagesc(labeled);

% print regions moments
for i=1:max(labeled(:))
  R = labeled == i;
  printf("regija: %d \n", i);
  printf("moment(0,0): %d \n", moment(R, 0, 0));
  printf("moment(1,0): %d \n", moment(R, 1, 0));
  printf("moment(0,1): %d \n", moment(R, 0, 1));
end