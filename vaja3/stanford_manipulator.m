function [T1, T2, T3] = stanford_manipulator(parameters)
  % INPUT: theta1, theta2, d3
  T1 = dh_joint([0, -pi/2, 5, parameters(1)]);
  T2 = T1 * dh_joint([0, pi/2, 5, parameters(2)]);
  T3 = T2 * dh_joint([0, 0, 2 + parameters(3), 0]);  

end