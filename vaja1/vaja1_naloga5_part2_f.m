pkg load image

figure(1); 

original = imread('candy.jpg'); 
imshow(original);

% read point
[x,y] = ginput(1);
x=round(x);
y=round(y);

% points for testing
% x = 201;
% y = 305;

figure(1); 

% show original image
subplot(2,4,1);
imshow(original);

% transform original image to gray
I = rgb2gray(original);
I = imadjust(I,[0.5 1],[]);

subplot(2,4,2); 
imshow(I);

% transform image to black white
I = I < 170;

subplot(2,4,3);
imshow(I);

% improve background separation with morphologicall operations
se = ones(2, 2);
C1 = imopen(I, se);

se = ones(6, 6);
C1 = imclose(C1, se);

subplot(2,4,4);
imshow(C1);

% label image parts
labeled = bwlabel(C1);
subplot(2,4,6);
imagesc(labeled);

% get bounding boxes and centroids
s = regionprops(labeled,'centroid');
b = regionprops(labeled,'BoundingBox');
centroids = cat(1, s.Centroid);

% get a and b from lab
lab_he = rgb2lab(mask);
a_lab = lab_he(:,:,2);
b_lab = lab_he(:,:,3);

% set area size for pixel lookup
area = 10;
counter = 0;

subplot(2,4,7);
imshow(original);
hold on
  plot(centroids(:,1),centroids(:,2), 'rx');
  
  % find which bounding box was clicked by user
  for i = 1 : length(b)
    bbox = b(i).BoundingBox;
    rectangle(
      'Position', bbox,
      'EdgeColor', 'g',
      'LineWidth', 1 
    );
    bx = bbox(1);
    by = bbox(2);
    bw = bbox(3);
    bh = bbox(4);
    
    % check if user clicked inside current bounding box
    is_inside = inpolygon(x, y, [bx, bx+bw, bx, bx+bw], [by, by+bh, by+bh, by]);
    if (is_inside)      
      rectangle(
        'Position', bbox,
        'EdgeColor', 'r',
        'LineWidth', 2
        );
      xc = round(centroids(i,1))
      yc = round(centroids(i,2))
      
      a_selection = mean(a_lab(yc-area:yc+area, xc-area:xc+area, :)(:))
      b_selection = mean(b_lab(yc-area:yc+area, xc-area:xc+area, :)(:))
      id_selection = i;    
    end
  end
hold off

figure(2)
subplot(1,1,1);
imshow(original);

hold on
  plot(centroids(:,1),centroids(:,2), 'rx');
  % find similar bounding boxes to the one user clicked
  for i = 1 : length(b)
    bbox = b(i).BoundingBox;
    rectangle(
      'Position', bbox,
      'EdgeColor', 'g',
      'LineWidth', 0.5 
    );
    bx = bbox(1);
    by = bbox(2);
    bw = bbox(3);
    bh = bbox(4);
    
    xc = round(centroids(i,1));
    yc = round(centroids(i,2));    
    
    a_c_selection = mean(a_lab(yc-area:yc+area, xc-area:xc+area, :)(:));
    b_c_selection = mean(b_lab(yc-area:yc+area, xc-area:xc+area, :)(:)); 
  
    a_diff = abs(a_c_selection - a_selection);
    b_diff = abs(b_c_selection - b_selection);
    
    % draw rect if bounding box is similar
    if (a_diff + b_diff) < 21
      rectangle(
          'Position', bbox,
          'EdgeColor', 'r',
          'LineWidth', 3
          );
          counter += 1;
    end
    
  end
 
title(sprintf("Found %d similar candies", counter));

hold off
