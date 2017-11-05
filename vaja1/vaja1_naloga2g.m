pkg load image-acquisition
pkg load image

figure(1);

obj = videoinput("v4l2", "/dev/video0");
set(obj, "VideoFormat", "RGB3");  % To convert video format from RGB24 to RGB3
start(obj, 1); % Start streaming with two buffers

for idx = 1:50
   % Acquire a single image.
   rgbImage = getsnapshot(obj);

   % Convert RGB to grayscale.
   grayImage = rgb2gray(rgbImage); 

   % Display the image.
   imshow(grayImage > 127);
   
   drawnow
end

stop(obj);

% source
% https://lifearoundkaur.wordpress.com/2015/07/11/getting-an-image-into-octave-from-a-local-camera/
% https://www.mathworks.com/help/supportpkg/usbwebcams/ug/acquire-webcam-images-in-a-loop.html