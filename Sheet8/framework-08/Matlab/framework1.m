%%Contributed by Xiaotian Zhou and Yongfeng Zhong
%% Load image from file, scale values to 0..1:
img = single(imread('../img.png')) / 255; % Size is 256x256

% Load blur kernel from file, and normalize to sum up to 1:
kernel = single(imread('../kernel.png')); 
% Size is 32x32, Usually a kernel has odd number of rows and colounms.
kernel = kernel / sum(kernel(:));

% Pad from 32x32 to 256x256 so both matrices have same size:
%kernel = padarray(kernel, [(256-32)/2 (256-32)/2]);  

% Compute img_blurred

%flip the kernel so that we can change convolution to correlation
%The convolution of a img with a kernel = the correlation of this image
%with the flip kernel.
flip_kernel = flip(kernel);

[rows, cols] = size(img); 
% Pad with circular repetition (wrapping).
img_cir = padarray(img,[32/2,32/2],'circular');
for i = 1 : rows
    for j = 1 : cols
        img_sec = img_cir(i:i+31,j:j+31);
        img_blurred(i,j) =sum( sum(img_sec.*flip_kernel));%correlation
    end 
end 

% Display blurred image
imshow(img_blurred,[]); %% [] is used for scaling image to appropriate range.
title('My blurred image')
%use the build in function conv2
figure(2)
img_blurred2 = conv2(img_cir,kernel,'valid');
imshow(img_blurred2,[]);
title('Blurred image by build in function conv2')
%% convolution in Fourier domain
kernel = padarray(kernel, [(256-32)/2 (256-32)/2]);  
PQ = 2* size(img);%padding size, use to  pad the edges of the image. 

F_img =fft2(double(img),PQ(1),PQ(2)); % Compute Fourier Transform with padding

%This five lines ara for showing the Fourier spectra
F_img_2 = abs(F_img);% compute the magnitude (square root of the sum of the squares of the real and imaginary parts)
F_img_2 = fftshift(F_img_2);% Center FFT
F_img_2 = log(1+F_img_2 ); % To brighten the display
figure (3), imshow(F_img_2,[]);
title('Fourier spectra of input image')

F_kernel = fft2(double(kernel),PQ(1),PQ(2));

F_kernel_2 = abs(F_kernel);
F_kernel_2 = fftshift(F_kernel_2);
F_kernel_2 = log(1+ F_kernel_2);
figure (4), imshow(F_kernel_2,[]);
title('Fourier spectra of the kernal')

FDF = F_img.*F_kernel;%Multiply the transform by the filter:
fdf = real(ifft2(FDF));%Inverse Fourier transform to recover the ideal image
figure(5)
%remove the padding area
%[xmin ymin width height] indicates the position and the size of the crop rectangle.
[r,c]=size(img);
fdf = imcrop(fdf, [r/2+1 c/2+1 r c]);
imshow(fdf,[]);
title('Blureed image by fast Fourier transform')

