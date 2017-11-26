function Ig = my_median_filter(I, W)
  N = ceil((W-1)/2); 
  Ig = zeros(size(I));
  [y, x] = size(I); 

  for i = N+1 : y-N
    i_up = max([1, i-N]); 
    i_down = min([length(I), i+N]); 
    for j = N+1 : x-N 
      j_left = max([1, j-N]); 
      j_right = min([length(I), j+N]); 
      part = I(i_up : i_down, j_left : j_right);
      Ig(i,j) = median(part(:));
    end  
  end
end  

pkg load image

A = rgb2gray(imread('lena.png')); 
Icg = imnoise(A,'gaussian', 0, 0.01); % Gaussian noise 
figure; 
subplot(3,2,1); 
imshow(Icg); 
colormap gray; 
axis equal; 
axis tight; 
title('Gaussian noise'); 
Ics = imnoise(A,'salt & pepper', 0.1); % Salt & pepper noise 
subplot(3,2,2) ; 
imshow(uint8(Ics)); 
colormap gray; 
axis equal; 
axis tight; 
title('Salt and pepper'); 
Icg_b = gaussfilter(double(Icg), 1); 
Ics_b = gaussfilter(double(Ics), 1); 
subplot(3,2,3) ; imshow(uint8(Icg_b)); 
colormap gray; 
axis equal; 
axis tight; 
title('Filtered gauss') ; 
subplot(3,2,4) ; 
imshow(uint8(Ics_b)); 
colormap gray; 
axis equal; 
axis tight; 
title('Filtered gauss');

Icg_m = my_median_filter(double(Icg), 4);
subplot(3,2,5) ; 
imshow(uint8(Icg_m)); 
colormap gray; 
axis equal; 
axis tight; 
title('Filtered median');

Ics_m = my_median_filter(double(Ics), 4);
subplot(3,2,6) ; 
imshow(uint8(Ics_m)); 
colormap gray; 
axis equal; 
axis tight; 
title('Filtered median');