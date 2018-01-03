I = imread("camera1.jpg");
H = load("camera1.txt");

n = 10; 

X = linspace(0, 200, n); 
Y = linspace(0, 200, n); 

figure(1); 

imshow(I); % Draw the image 
hold on; 
for i = 1:n 
  plot([X(i), X(i)], [Y(1), Y(end)], 'b'); 
  plot([X(1), X(end)], [Y(i), Y(i)], 'b'); 
  
  xyh = H * [X(i), Y(i), 1]';
  xyh_1 = H * [X(1), Y(1), 1]';
  xyh_end = H * [X(end), Y(end), 1]';
  
  xyh = xyh ./ xyh(end);
  xyh_1 = xyh_1 ./ xyh_1(end);
  xyh_end = xyh_end ./ xyh_end(end);
  
  plot([xyh(1), xyh(1)], [xyh_1(2), xyh_end(2)], 'r'); 
  plot([xyh_1(1), xyh_end(1)], [xyh(2), xyh(2)], 'r'); 

end 
hold off;