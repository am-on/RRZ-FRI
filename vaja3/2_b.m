% Setup world: world structure defines the bounds of the world and
% points in the world used for navigation
world = world_setup(1, 200);

% We will use two points in this sample.
world.points = [pi/2, pi/2 + 0.5, 1; 2, 2, 4]';

% Setup script for antropomorphic manipulator.
setup_antropomorphic;
%setup_stanford;

% Draw world
manipulator_draw(world, manipulator);

% Solve the IK problem for a checkpoint
% state is a vector of joint states that bring the point of
% the manipulator to the desired position
state = manipulator_solve(manipulator, world.points(:, 1)');
% Transition to the new manipulator state
manipulator = manipulator_animate(world, manipulator, state, 10);

% Now do the same for the second point
state = manipulator_solve(manipulator, world.points(:, 2)');
% Transition to the new manipulator state
manipulator = manipulator_animate(world, manipulator, state, 10);
