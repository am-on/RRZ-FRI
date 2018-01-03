parameters = [0.2, 0.1, 0.3];
[aT1, aT2, aT3] = antropomorphic_manipulator(parameters)

origin = [0, 0, 0, 1]' % homogeneous cordinates
point = [3, 3, 4, 1]'

man_loc = aT3 * origin

distance = sqrt(sum((man_loc - point).^2))

