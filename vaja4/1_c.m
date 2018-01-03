I = imread("camera1.jpg");
H = inv(load("camera1.txt"));
n = 5;
figure(1); 

subplot(1, 2, 1); 
imshow(I);
[xi, yi] = ginput (n);
hold on
for i = 1:n
  plot(xi(i), yi(i), "marker", "x", "color", 'b', "markersize", 20); 
end
hold off

subplot(1, 2, 2); 
hold on
for i = 1:n
  xyh = H * [xi(i), yi(i), 1]';
  xyh = xyh ./ xyh(end);

  plot(xyh(1)*-1, xyh(2), "marker", "x", "color", 'b', "markersize", 20); 

end
hold off