load kernel.txt;


figure(1)
hold on;
# plot(kernel);

[x , y] = gauss(0.5)
plot(y, x);

[x , y] = gauss(1)
plot(y, x);

[x , y] = gauss(2)
plot(y, x);

[x , y] = gauss(3)
plot(y, x);

[x , y] = gauss(4)
plot(y, x);

legend (
  "sigma = 0.5", 
  "sigma = 1", 
  "sigma = 2",
  "sigma = 3",
  "sigma = 4"
);
hold off;

