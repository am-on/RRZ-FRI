function [A, B, C] = antropomorphic_manipulator(parameters)
  % INPUT: thetas of each joint
  A =     dh_joint([0, pi/2, 3, parameters(1)]);
  B = A * dh_joint([3, 0, 0, parameters(2)]);
  C = B * dh_joint([3, 0, 0, parameters(3)]);  
end