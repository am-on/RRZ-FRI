pkg load image

I = imread('regions.png'); 
I = I > 127;
I = I(:, :, 1);
figure(1); 

subplot(2,2,1);
labeled = bwlabel(I);
imagesc(labeled);

function [moment] = moment(R, p, q)
  [row,col] = find(R);
  p_moment = row .^ p;
  q_moment = col .^ q;
  moment = sum(p_moment .* q_moment);
end

function [x, y] = centroid(R)
  m0 = moment(R, 0, 0);
  x = moment(R, 1, 0) / m0;
  y = moment(R, 0, 1) / m0;
end

function [central_moment] = central_moment(R, p, q)
  [row,col] = find(R);
  [center_x, center_y] = centroid(R);
  p_moment = (row .- center_x) .^ p;
  q_moment = (col .- center_y) .^ q;
  central_moment = sum(p_moment .* q_moment);
end

region1 = labeled == 1;
sum(region1(:))
moment(region1, 0, 0)
central_moment(region1, 0, 0)