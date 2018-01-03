parameters = [.0, pi/4, .3];
[sT1, sT2, sT3] = stanford_manipulator(parameters)

parameters = [0, pi/4, -pi/2];
[aT1, aT2, aT3] = antropomorphic_manipulator(parameters)

origin = [0, 0, 0, 1]' % homogeneous cordinates

c_sT1 = sT1 * origin;
c_sT2 = sT2 * origin;
c_sT3 = sT3 * origin;

c_aT1 = aT1 * origin;
c_aT2 = aT2 * origin;
c_aT3 = aT3 * origin;

stanfordP = zeros(4, 4);
stanfordP(:, 1) = origin';
stanfordP(:,2) = c_sT1;
stanfordP(:,3) = c_sT2;
stanfordP(:,4) = c_sT3;

antropomorphicP = zeros(4, 4);
antropomorphicP(:, 1) = origin';
antropomorphicP(:,2) = c_aT1;
antropomorphicP(:,3) = c_aT2;
antropomorphicP(:,4) = c_aT3;

subplot(1,2,1);
axis equal;
plot3(antropomorphicP(1,:), antropomorphicP(2,:), antropomorphicP(3,:), 'color', [0,0,0], 'linewidth', 4);
hold on;
axis equal;
scatter3(antropomorphicP(1,:), antropomorphicP(2,:), antropomorphicP(3,:), 60, [0.5 0.5 0.5]);
hold off;

subplot(1,2,2);
axis equal;
plot3(stanfordP(1,:), stanfordP(2,:), stanfordP(3,:), 'color', [0,0,0], 'linewidth', 4);
hold on;
axis equal;
scatter3(stanfordP(1,:), stanfordP(2,:), stanfordP(3,:), 60, [0.5 0.5 0.5]);