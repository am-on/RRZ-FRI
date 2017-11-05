pkg load image

I = imread('regions.png'); 
I = I > 127;
I = I(:, :, 1);

figure(1); 
s = regionprops(I,'centroid');
b = regionprops(I,'BoundingBox');

centroids = cat(1, s.Centroid);
imshow(I)

hold on

plot(centroids(:,1),centroids(:,2), 'rx')
for i = 1 : length(b)
  rectangle(
    'Position', b(i).BoundingBox,
    'EdgeColor', 'g',
    'LineWidth', 1 
  )
end

hold off






