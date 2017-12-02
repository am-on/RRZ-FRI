function [y, x] = harris(I, varargin)
  alpha = 0.05;
  threshold = 25000;
  neighborhood = 20;

  for j=1:2:length(varargin)
      switch lower(varargin{j})
          case 'threshold', threshold = varargin{j+1};
          case 'alpha', count = varargin{j+1};
          case 'neighborhood', neighborhood = varargin{j+1};
          otherwise, error(['unrecognized argument ' varargin{j}]);
      end
  end 
   
  % prefilter for smoothing image
  Hpx = 1/9 .* [2, 5, 2];
  Hp = conv2(Hpx, Hpx');
  
  % smooth original image
  I = conv2(I, Hp, 'same'); 
    
  % gradient filter
  Hdx = [-0.453014, 0, 0.453014];
  
  % get derivatives
  Ix = conv2(I, Hdx, 'same');
  Iy = conv2(I, Hdx', 'same');
  
  % compute parts of the local structure matrix
  A = Ix .^ 2;
  B = Iy .^ 2;
  C = Ix .* Iy;
  
  % blur filter
  Hbx = 1/64 .* [1, 6, 15, 20, 15, 6, 1];
  Hb = conv2(Hbx, Hbx');
  
  % blur components of the local structure matrix_type
  A = conv2(A, Hb, 'same');
  B = conv2(B, Hb, 'same');
  C = conv2(C, Hb, 'same');
  
  % compute corner response function
  Q = (A .* B .- C .^2) .- alpha .* (A .+ B) .^ 2;
  Q = nonmaxima_suppression(Q, neighborhood);
  
  [y,x] = find(Q > threshold);
end


