pkg load image

function p = get_point(x, y, h)
  p = h * [x, y, 1]';
  p = p ./ p(end);
  p = p(1:end-1);
end

function img = immask(rgb, bin)  
  R = rgb(:, :, 1);
  R(bin ~= 1) = 0;
  
  G = rgb(:, :, 2);
  G(bin ~= 1) = 0;
  
  B = rgb(:, :, 3);
  B(bin ~= 1) = 0;
  
  img = cat(3, R, G, B);
end

ip = '192.168.1.111';

world = world_setup(1, 200);            
manipulator = manipulator_create(ip);   
manipulator_draw(world, manipulator);

camera = camera_create(ip); % Create camera handle
image = camera_image(camera); % Retrieve current image
homography = camera_position(camera); % Retrieve current homoraphy

figure(2);
imshow(image); % Display image
hold on;
  % draw limits
  A = get_point(100, -200, homography);
  B = get_point(100, 200, homography);
  C = get_point(300, 200, homography);
  D = get_point(300, -200, homography);
   
  plot(A(1), A(2), "marker", "x", "color", 'y', "markersize", 10); 
  plot(B(1), B(2), "marker", "x", "color", 'y', "markersize", 10); 
  plot(C(1), C(2), "marker", "x", "color", 'y', "markersize", 10); 
  plot(D(1), D(2), "marker", "x", "color", 'y', "markersize", 10); 

  plot([A(1), B(1)], [A(2), B(2)], 'b'); 
  plot([B(1), C(1)], [B(2), C(2)], 'b');  
  plot([C(1), D(1)], [C(2), D(2)], 'b');
  plot([D(1), A(1)], [D(2), A(2)], 'b');   

hold off;

% get mask
bw = poly2mask(
                [A(1), B(1), C(1), D(1)], 
                [A(2), B(2), C(2), D(2)], 
                rows(image), 
                columns(image)
              );
              
I = immask(image, bw);
I = rgb2hsv(I);

H1 = I(:,:,1) >= 0.55;
H2 = I(:,:,1) <= 0.7;
H3 = I(:,:,2) >= 0.3;

HBlue = H1 & H2 & H3; 

HBlack = I(:,:,3) < 0.2 &  I(:,:,3) > 0.05;


% initialize a simple strucural element  
se = ones(3, 3); 
B1 = imerode(HBlue, se); 
Blue = imdilate(B1, se); 

B1 = imerode(HBlack, se); 
Black = imdilate(B1, se); 




% label image parts
labeledBlue = bwlabel(Blue);
labeledBlack = bwlabel(Black);

% get centroids
sBlue = regionprops(labeledBlue,'centroid');
centroidsBlue = cat(1, sBlue.Centroid);

sBlack = regionprops(labeledBlack,'centroid');
centroidsBlack = cat(1, sBlack.Centroid);

% plot centroids on original image
hold on
  plot(centroidsBlue(:,1),centroidsBlue(:,2), 'gx');
  plot(centroidsBlack(:,1),centroidsBlack(:,2), 'rx');
hold off



% transform centroid coordinates
h = inv(homography);
for i = 1:max(length(centroidsBlue), length(centroidsBlack))
  
  if(length(centroidsBlue) >= i)
    c = [centroidsBlue(i, 1), centroidsBlue(i, 2), 1];
    c = h * c';
    c(end) = 50;
    state = manipulator_solve(manipulator, c');
    state(7) = 1;
    state(6) = 0;
    manipulator = manipulator_animate(world, manipulator, state, 5);
  endif
  
  if(length(centroidsBlack) >= i)
    c = [centroidsBlack(i, 1), centroidsBlack(i, 2), 1];
    c = h * c';
    c(end) = 50;
    state = manipulator_solve(manipulator, c');
    state(7) = 0;
    state(6) = 1.14;
    manipulator = manipulator_animate(world, manipulator, state, 5);
  endif
  
end