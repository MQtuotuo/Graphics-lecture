close all; clear;

% load 'peppers.png' (the values are given in uint8, i.e. [255,0,0]
% represents 'red')
img_rgb = imread('../peppers.png');

% the HSV image can be calculated using 'rgb2hsv':
img_hsv = rgb2hsv(img_rgb);

% display the images:
figure;
subplot(1,3,1); imshow(img_rgb); title('image in RGB space');
subplot(1,3,2); imshow(img_hsv); title('image in HSV space');

% now, convert the HSV image back to the RGB space (do not use the Matlab
% internal function for this): implement the function 'convert_hsv2rgb' for
% this
%img_RGB_estimated = convert_hsv2rgb_new(img_hsv);
img_RGB_estimated = convert_hsv2rgb_new2(img_hsv);

% display the result:
subplot(1,3,3); imshow(img_RGB_estimated); title('re-conversion of HSV image to RGB space');

% if you are not succesful in implementing this conversion you can use the
% following line to continue with the next task:
%img_RGB_estimated = hsv2rgb(img_hsv);

% segment the image based on thresholding of the color information:

h = img_hsv(:,:,1);
s= img_hsv(:,:,2);
v = img_hsv(:,:,3);

h(h<270/360 |h> 320/360)=NaN;
img(:,:,1)=h;
img(:,:,2)=s;
img(:,:,3)=v;
img = hsv2rgb(img);
imshow(img)

%%Answer for 1b
%The color space HSV has been chosen, to segment the image with color value,
%for one color in RGB space, we need the three values R G B(all color 
%channles) and then difine the color range.
%However, in HSV space, since hue has represent the most colors, so for a
%simple segment, just define the range of hue, then one color can be
%approximately choosen.
%In this time, the background color purple has been choosen,as its hue is
%between 270 and 310. So although the channel still should be devided and
%got, we need just change one.
