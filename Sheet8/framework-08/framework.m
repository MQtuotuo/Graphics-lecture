clear all;
clc;

% Load image from file, scale values to 0..1:
img = single(imread('img.png')) / 255; % Size is 256x256

% Load blur kernel from file, and normalize to sum up to 1:
kernel = single(imread('kernel.png')); % Size is 32x32
kernel = kernel / sum(kernel(:));

kCenterX = size(kernel, 1) / 2;
kCenterY = size(kernel, 2) / 2;
kRows = size(kernel, 1);
kCols = size(kernel, 2);
rows = size(img, 1);
cols = size(img, 2);

% Compute img_blurred
img_blurred = zeros(256, 256);
for i = 1:rows
    for j = 1:cols
        for x = 1:kRows
            m = kRows-x+1;
            for y = 1:kCols
                n = kCols-y+1;
                i_ = i + x - kCenterX - 1 ;
                j_ = j + y - kCenterY - 1 ;
               
                if i_ > 0 && i_ <= rows && j_ > 0 && j_ <= cols 
                    img_blurred(i,j) = img_blurred(i,j) + img(i_, j_) * kernel(m,n);
                end
            end
        end
    end
end

img_blurred_mat = conv2(img, kernel);

mm = rows + kRows - 1;
nn = cols + kCols - 1;
ccirc_img = ifft2(fft2(img, mm, nn).* fft2(kernel, mm, nn));
figure;

figure(1);
imshow(img,[]);  title('Original Image');

% Display blurred image
figure(2);
subplot(1,2,1), imshow(img_blurred_mat,[]);  title('Matlab Convolution') ; 
subplot(1,2,2), imshow(img_blurred,[]);  title('Implemented Convolution(Linear)');

figure(3);
imshow(ccirc_img,[]);  title('Convolution in Frequency Domain');



