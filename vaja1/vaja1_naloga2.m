A = imread('umbrellas.jpg'); % Image A is in 8-bit format (uint8)
%figure(1); clf; imagesc(A); % open figure window, clear, draw
%figure(2); clf; imshow(A);

% transform from uint8 to double, so we can divide
Ad = double(A); % division operation not defined for uint8
[h,w,d] = size(A) % output the size of the image (notice the absence of semicolon at the end of the line)
A_gray = (Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0;
%figure; imshow(uint8(A_gray)); % change image to 8-bit before displaying it

% colormap (jet);
% colormap (bone);
% colormap (gray);

% set Blue section to 0
A1 = A;
A1(130:260,240:450,3) = 0 ;
figure;
subplot(1,2,1);
imshow(A1);

% crop section
A2 = A(130:260,240:450, 1);
subplot(1,2,2);
imshow(A2);

% reverse color on part of selection
A3 = A_gray;
A3(130:260,240:450) = 255 - A3(130:260,240:450) ;
figure; imshow(uint8(A3));

%
A5 = A_gray;
A5 = A5 > 150 ; % all elements with value > 150 are changed to 1, others are changed to 0
figure(1);
imagesc(A5);
