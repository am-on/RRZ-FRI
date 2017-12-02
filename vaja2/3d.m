function A = accumulator(bins_theta, bins_rho, max_rho, Ie)
  % bins_theta = 300; 
  % bins_rho = 300; Resolution of the accumulator array 
  % max_rho = 100; Usually the diagonal of the image 
  val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known 
  val_rho = linspace(-max_rho, max_rho, bins_rho); 
  A = zeros(bins_rho, bins_theta);

  for y = 1:rows(Ie)
    for x = 1:columns(Ie)
      % for point at (x, y) 
      if Ie(y,x) > 0
        rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas 
        bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho 
        for i = 1:bins_theta % Go over all the points 
          if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check 
            A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells 
          end; 
        end; 
      end;
    end;
  end;
 
end
pkg load image;

I = rgb2gray(imread('oneline.png')); 
Ie = edge(I, "Canny");
diagonal = floor(sqrt(rows(Ie) ^ 2 + columns(Ie) ^ 2));
A1 = accumulator(500, 500, diagonal, Ie);

I2 = rgb2gray(uint8(imread('rectangle.png')) .*255); 
Ie = edge(I2, "Canny");
diagonal = floor(sqrt(rows(Ie) ^ 2 + columns(Ie) ^ 2));
A2 = accumulator(500, 500, diagonal, Ie);

figure();
subplot(2, 1, 1);
imagesc(A1);

subplot(2, 1, 2);
imagesc(A2);
