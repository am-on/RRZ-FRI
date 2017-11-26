load kernel.txt;
load signal.txt;

result = conv(signal, kernel, 'same')

figure(1)
hold on;
plot(kernel);
plot(result);
plot(signal);
hold off;
