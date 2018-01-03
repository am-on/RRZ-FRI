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
end 
hold off;