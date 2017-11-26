load signal.txt;
figure(1)

k1 = gauss(2);
k2 = [0.1, 0.6, 0.4];
k1_2 = conv(k1, k2, 'same');

r1 = conv(conv(signal, k1, 'same'), k2, 'same');
r2 = conv(conv(signal, k2, 'same'), k1, 'same');
r3 = conv(signal, k1_2, 'same');

subplot(1,4,1);
plot(signal);
title("signal")

subplot(1,4,2);
plot(r1);
title("(s * k1) * k2");

subplot(1,4,3);
plot(r2);
title("(s * k2) * k3");

subplot(1,4,4);
plot(r3);
title("(k1 * k2) * s");

