%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

close all; clear;

% load data:
%   points:     (Nx3) vector of vertex coordinates
%   normals:     (Nx3) vector of vertex normals
load('../data.mat');

% display the vertices & normals
p_ = points;
n_ = normals;
figure; plot3(p_(:, 1), p_(:, 2), p_(:, 3), 'b.'); axis equal;
figure; quiver3(p_(:, 1), p_(:, 2), p_(:, 3), n_(:, 1), n_(:, 2), n_(:, 3));

% select the number of clusters
k = 5;

% <exercise>
% Use your *own* k-means implementation to find 'k' cluster centers in
% the norms.  The array 'map_to_centers' should contain the index of the 
% center of each normal in 'VN'.
[map_to_centers,center_colors]=my_kmeans(normals,5);
% </exercise>

% display the clustering
figure; hold on; axis equal;
center_colors = hsv2rgb([360/k*(1:k)'/360, ones(k, 2)]);
for i=1:k
    colour_hsv = [360/k*i/360,1,1];
    colour_rgb = hsv2rgb(colour_hsv);
    active = find(map_to_centers==i);
    p_ = points(active, :);
    n_ = normals(active, :);
    quiver3(p_(:, 1), p_(:, 2), p_(:, 3), n_(:, 1), n_(:, 2), n_(:, 3), 'Color', colour_rgb);
end
hold off;

