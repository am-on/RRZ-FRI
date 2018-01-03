% A demonstration program for the sample robot manipulator environment

disp('This is a demo of stohastic IK solver for a remote manipulator.');

% Setup world: world structure defines the bounds of the world and
% points in the world used for navigation
world = world_setup(1, 200);


world.points = [
                100, -190, 90;
                140, 160, 120;
                160, 150, 140;
                180, 180, 180;     
               ]';


            
manipulator = manipulator_create('192.168.1.10');   
manipulator_draw(world, manipulator);

while 1==1
  for x = 1:length(world.points)
     state = manipulator_solve(manipulator, world.points(:, x)');
     % Transition to the new manipulator state
     manipulator = manipulator_animate(world, manipulator, state, 0.1);
  end 
end

