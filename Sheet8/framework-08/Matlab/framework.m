% Load image from file, scale values to 0..1:
img = single(imread('../img.png')) / 255; % Size is 256x256

% Load blur kernel from file, and normalize to sum up to 1:
kernel = single(imread('../kernel.png')); % Size is 32x32
kernel = kernel / sum(kernel(:));

% Pad from 32x32 to 256x256 so both matrices have same size:
kernel = padarray(kernel, [(256-32)/2 (256-32)/2]);

% Compute img_blurred

img_blurred = zeros(size(img));
% make b xy-reflection and vector
vectB = reshape(flipdim(flipdim(kernel,1),2)' ,[] , 1);
% padding img with zeros
paddedA = padarray(img, [floor(size(kernel,1)/2) floor(size(kernel,2)/2)]);
% Loop over A matrix:
for i = 1:size(img,1)
    for j = 1:size(img,2)
        startAi = i;
        finishAi = i + size(kernel,1) - 1;
        startAj = j;
        finishAj = j + size(kernel,2) - 1;
        vectPaddedA = reshape(paddedA(startAi :finishAi,startAj:finishAj)',1,[]);
        img_blurred(i,j) = vectPaddedA* vectB;
    end
end
    
% Display blurred image
imshow(img_blurred,[]);

%Compare with the defined function
c=conv2(img,kernel,'same');
figure(2)
imshow(c,[]);


%%Task2
%Use 2D Fourier transform and inverse Fourier transform
s=ifft2(fft2(img).*fft2(kernel));
%restore a meaningful picture
s1=fftshift(s);
figure()
imshow(s1,[])





