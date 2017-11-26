load kernel.txt;
load signal.txt;

result = simple_convolution(signal, kernel);

figure(1)
hold on;
plot(kernel);
plot(result);
plot(signal);
hold off;

sum(kernel)