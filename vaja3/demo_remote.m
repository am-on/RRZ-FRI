% A demonstration program for the sample robot manipulator environment

disp('This is a demo of stohastic IK solver for a remote manipulator.');

% Setup world: world structure defines the bounds of the world and
% points in the world used for navigation
world = world_setup(1, 200);

% We will use two points in this sample.
world.points = [                
                400, 0, 100;
               ]';

manipulator = manipulator_create('192.168.1.142');

manipulator_draw(world, manipulator);

  for x = 1:length(world.points)
      state = manipulator_solve(manipulator, world.points(:, x)');
      % Transition to the new manipulator state
      manipulator = manipulator_animate(world, manipulator, state, 1)
  end
  


