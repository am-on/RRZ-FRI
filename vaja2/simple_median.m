function Ig = simple_median(I, W) 
  N = ceil((W-1)/2) ; 
  Ig = zeros(1, length(I)) ; 
  for i = N+1 : length(I)-N 
    i_left = max([1, i-N]) ; 
    i_right = min([length(I), i+N]) ; 
    % sort the values and select the middle one end
    part = I(i_left : i_right);
    sort(part);
    Ig(i) = median(part);
  end
end  