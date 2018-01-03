% Setup world: world structure defines the bounds of the world and
% points in the world used for navigation
%world = world_setup(1, 200);

% We will use two points in this sample.
%world.points = [100, -180, 100; 100, 0, 100; 100, 180, 100]';

A = [100, -180, 100]';
B = [100, 0, 100]';
C = [100, 180, 100]'; 

function [reversed, t1, t2] = move(t1, t2)
  
  c1 = 0;
  c1i = length(t1) + 1;
  
  c2 = 0;
  c2i = length(t1) + 1;
  
  % find first disk in t1
  for i = 1:length(t1)
    if(t1(i) != 0)
      c1 = t1(i);
      c1i = i;
      break;
    end
  end
  
   % find first disk in t2
   for i = 1:length(t2)
    if(t2(i) != 0)
      c2 = t2(i);
      c2i = i;
      break;
    end
  end
  
   if((c1 < c2 && c1 !=0) || c2 == 0)
    t1(c1i) = 0;
    t2(c2i-1) = c1;
    reversed = false;
  else
    t2(c2i) = 0;
    t1(c1i-1) = c2;
    reversed = true;
  end 
   
end

function move_manipulator(world, manipulator, reversed, t1, t2)
  if(!reversed)
    state = manipulator_solve(manipulator, t1');
    manipulator = manipulator_animate(world, manipulator, state, 2);
    state = manipulator_solve(manipulator, t2');
    manipulator = manipulator_animate(world, manipulator, state, 2);
  else
    state = manipulator_solve(manipulator, t2');
    manipulator = manipulator_animate(world, manipulator, state, 2);
    state = manipulator_solve(manipulator, t1');
    manipulator = manipulator_animate(world, manipulator, state, 2);
  end
end

function hanoi(n)
  
    % For an even number of disks:
    % make the legal move between pegs A and B (in either direction),
    % make the legal move between pegs A and C (in either direction),
    % make the legal move between pegs B and C (in either direction),
    % repeat until complete.

    % For an odd number of disks:
    % make the legal move between pegs A and C (in either direction),
    % make the legal move between pegs A and B (in either direction),
    % make the legal move between pegs B and C (in either direction),
    %repeat until complete.

  world = world_setup(1, 200);  
  setup_antropomorphic;

  manipulator_draw(world, manipulator);

  
  A = [100, -180, 100]';
  B = [100, 0, 100]';
  C = [100, 180, 100]'; 
  
  ta = [1:n]';
  tb = zeros(n,1);
  tc = zeros(n,1);
  
  reversed = false;
  
  for m = 1:2^n-1
    seq = mod(m, 3);
    if (mod(n, 2) != 0)
      switch (seq)
        case 1
          [reversed, ta, tc] = move(ta, tc);
          move_manipulator(world, manipulator, reversed, A, C);
        case 2
          [reversed, ta, tb] = move(ta, tb);
          move_manipulator(world, manipulator, reversed, A, B);
        case 0
          [reversed, tb, tc] = move(tb, tc);
          move_manipulator(world, manipulator, reversed, B, C);
      endswitch      
    else
      switch (seq)
        case 1
          [reversed, ta, tb] = move(ta, tb);
          move_manipulator(world, manipulator, reversed, A, B);
        case 2
          [reversed, ta, tc] = move(ta, tc);
          move_manipulator(world, manipulator, reversed, A, C);
        case 0
          [reversed, tb, tc] = move(tb, tc);
          move_manipulator(world, manipulator, reversed, B, C);
      endswitch
    end
  end

  m  
  ta
  tb
  tc

  
  
end




hanoi(5);
