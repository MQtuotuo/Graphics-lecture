%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

close all; clear;

% load image
img = imread('../lenna.png');

colors = double(reshape(img, [size(img,1)*size(img,2), size(img,3)]));

% the number of clusters
ks = [5; 10; 15; 20];


figure; axis equal; hold on;

for i1 = 1:size(ks, 1)
    % number of clusters
    k = ks(i1);
    
    % display image
    data = colors;
    data = uint8(reshape(data, [size(img, 1), size(img, 2), 3]));
    subplot(size(ks, 1), 3, 1+i1*3-3); imagesc(data); axis ij; axis equal; axis off;

    % <exercise>
    % Use your *own* k-means implementation to find 'k' cluster centers in
    % the colors 'colors'.  Assign the variable 'center_colors' with the
    % representative color of each center (dimension: k x 3).  The array 
    % 'map_to_centers' should contain the center of each color in 'colors'.
    [map_to_centers,center_colors]=my_kmeans(colors,k);
    % </exercise>

    data = map_to_centers;
    data = uint8(reshape(data, [size(img, 1), size(img, 2)]));
    subplot(size(ks, 1), 3, 2+i1*3-3); imagesc(data); axis ij; axis equal; axis off;

    data = center_colors(map_to_centers, :);
    data = uint8(reshape(data, [size(img, 1), size(img, 2), 3]));
    subplot(size(ks, 1), 3, 3+i1*3-3); imagesc(data); axis ij; axis equal; axis off;
end

