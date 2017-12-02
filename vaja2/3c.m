function A = accumulator(bins_theta, bins_rho, max_rho, x, y)
  % bins_theta = 300; 
  % bins_rho = 300; Resolution of the accumulator array 
  % max_rho = 100; Usually the diagonal of the image 
  val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known 
  val_rho = linspace(-max_rho, max_rho, bins_rho); 
  A = zeros(bins_rho, bins_theta);

  % for point at (x, y) 
  rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas 
  bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho 
  for i = 1:bins_theta % Go over all the points 
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check 
      A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells 
    end; 
  end; 
end

figure();

subplot(2, 2, 1);
x = 10;
y = 10;
imagesc(accumulator(300, 300, 100, x, y)); % Display status of the accumulator

subplot(2, 2, 2);
x = 30;
y = 60;
imagesc(accumulator(300, 300, 100, x, y)); % Display status of the accumulator

subplot(2, 2, 3);
x = 50;
y = 20;
imagesc(accumulator(300, 300, 100, x, y)); % Display status of the accumulator

subplot(2, 2, 4);
x = 80;
y = 90;
imagesc(accumulator(300, 300, 100, x, y)); % Display status of the accumulator
