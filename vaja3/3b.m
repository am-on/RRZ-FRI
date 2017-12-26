% A demonstration program for the sample robot manipulator environment

disp('This is a demo of stohastic IK solver for a remote manipulator.');

% Setup world: world structure defines the bounds of the world and
% points in the world used for navigation
world = world_setup(1, 200);

% We will use two points in this sample.
world.points = [100, -180, 100;                 
                120, 0, 230;
                150, 0, 100;  
                240, 180, 200;
               ]';

world.points = [100, -180, 100;                 
                200, -200, 100;
               ]';
  
            
manipulator = manipulator_create('192.168.1.142');

for i=0:50
    a = 70;
    t = t + 0.5;
 
    x = a*cos(t);
    y = a*sin(t);
    xyz = int8([(x + 280), y, 100]);
    world.points = [world.points'; xyz]';
end
     

manipulator_draw(world, manipulator);
t = 0;
while 1==1
  for x = 1:length(world.points)
     state = manipulator_solve(manipulator, world.points(:, x)');
     % Transition to the new manipulator state
     manipulator = manipulator_animate(world, manipulator, state, 0.3);
  end 
end

