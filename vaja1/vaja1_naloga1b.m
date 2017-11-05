function vaja1_naloga1b
  f = 10 / 100;
  width = 2.5;  
  start_d = 10;
  acceleration = 0.5;
  
  time = 0:0.1:30;
  plot (
    time,
    projectionWidthAtTime(f, time, acceleration, width, start_d)
  );
  xlabel ("t [s]");
  ylabel ("x [cm]");
  title ("Velikost objekta na sliki, v odvisnosti od casa");
  
endfunction

function width = projectionWidthAtTime(
  f, time, acceleration, width, start_distance)
  # Calculate object width on projection at given time with
  # constant aceleration and starting distance
  distance = start_distance + calculateDistance(time, acceleration);
  width = projectionWidth(f, distance, width) * 100;
endfunction

function distance = calculateDistance (time, acceleration)
  # Calculate travelled distance in given time 
  # with constant acceleration
  distance = time .^ 2 * acceleration ./ 2;
endfunction

function pWidth = projectionWidth(f, d, X)
  # Calculate width of projected object
  # f - focal length
  # d - distance from camera to object
  # X - object size  
  pWidth = f * X ./ d;  
endfunction

