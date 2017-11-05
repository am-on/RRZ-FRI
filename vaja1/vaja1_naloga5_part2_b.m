pkg load image

I = imread('regions_noise.png'); 
I = I > 127;
I = I(:, :, 1);
figure(1); 

subplot(2,2,1);
labeled = bwlabel(I);
imagesc(labeled);

% number of regions
max(labeled(:))