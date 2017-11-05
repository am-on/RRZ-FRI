pkg load image

function img = my_imopen(img, structural_element)
  img = imdilate(img, structural_element);
  img = imerode(img, structural_element);
end

function img = my_imclose(img, structural_element)
  img = imerode(img, structural_element);
  img = imdilate(img, structural_element);  
end

I = imread('regions_noise.png') > 127; 
se = ones(3, 3); % initialize a simple strucural element 

A1 = my_imopen(I, se);
A2 = my_imclose(I, se); 
B1 = my_imclose(A1, se); 
B2 = my_imopen(A2, se); 
C1 = imopen(I, se);
C2 = imclose(I, se); 

figure(1); 
subplot(3, 3, 1);
imshow(I); 
title('original image'); 

subplot(3, 3, 2); 
imshow(A1); 
title('open'); 

subplot(3, 3, 3); 
imshow(A2); 
title('close'); 

subplot(3, 3, 5); 
imshow(B1); 
title('open, close'); 

subplot(3, 3, 6); 
imshow(B2);
title('close, open'); 

subplot(3, 3, 8); 
imshow(C1);
title('matlab open'); 

subplot(3, 3, 9); 
imshow(C2);
title('matlab close'); 

