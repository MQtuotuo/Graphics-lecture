close all; clear;

%% read image
img = imread('coins.png');
% convert to gray scale
img = mean(img, 3);
img = img / max(img(:));

% display image
figure(1); imshow(img);
colormap('gray');

%% get edge map
em = edge(img, 'canny');

% display edge image
figure(2); imshow(em);

% store the edge points
[edge_points(2, :), edge_points(1, :)] = find(em ~= 0);

% plot edge points into figure 1
figure(1); hold on; plot(edge_points(1, :), edge_points(2, :), '.b');

%% fit circles using RANSAC:
for i=1:10
%% repeatly run RANSAC to find all ten coins

% minimum sample size for initial model fitting of a circle
s = 3;
% maximum number of RANSAC iterations
max_iters = 10000;
% probability for outlier-free sample after N iterations
p = 0.99;
% acceptable margin around model circle for inliers
distance_threshold = 2;
% sample threshold for re-fitting (more inliers than this -> re-fit model params)
refit_threshold = 10;
% lower and upper bound for radii
radius_bounds = [4, 30];
% boundaries for center coordinates (i.e. image boundaries)
center_bounds = [1, size(img, 1); 1, size(img, 2)];
% total number of edge points
num_points = size(edge_points, 2);
% number of inliers in currently best fitting model
num_inliers_best = 0;

% those will store the results of the RANSAC procedure
% x-, y-coordinate and radius of the best fitting model
center_best = [];
radius_best = [];
% inlier samples corresponding to the best fitting model
inliers_best = [];
index_best = [];
N = max_iters;

current_iter = 0;

% start RANSAC iterations *in fact it's not really random)
while current_iter < max_iters && current_iter < N
    fprintf('iter %d, N = %d\n', current_iter, N);
    %% draw initial sample points:
    
    % implement this: pick s edge points at random
    samples_choose = randperm(size(edge_points,2),3);
    initial_samples = [edge_points(:,samples_choose(1)), ...
        edge_points(:,samples_choose(2)),edge_points(:,samples_choose(3))];
    
    %% fit model to initial sample points
    [center,radius] = fit_circle(initial_samples);
    
    %% discard models whose parameters are outside of the desired boundaries
    if radius < radius_bounds(1) || radius_bounds(2) < radius || ...
            center(1) < center_bounds(1, 1) || center_bounds(1, 2) < center(1) || ...
            center(2) < center_bounds(2, 1) || center_bounds(2, 2) < center(2)
        continue;
    end
    
    %% count inliers    
    % implement this: find all edge points lying on the circle within the specified margin
    k = size(edge_points,2);
    c_x = repmat(center(1,:),1,k);
    c_y = repmat(center(2,:),1,k);
    e_x = edge_points(1,:);
    e_y = edge_points(2,:);
    distance_to_center = sqrt((c_x - e_x).^2 + (c_y - e_y).^2);
    index = find((distance_to_center<=(2+radius))&(distance_to_center>=(radius-2)));
    inliers = edge_points(:,index);
    num_inliers = size(inliers, 2);
    if num_inliers >refit_threshold
    %% we optionally re-fit the model parameters if we have enough inliers
    [center, radius] = fit_circle(inliers);
    
    % count the inliers:
    num_inliers = size(inliers, 2);
    end
    %% did we find a better model than the previous one?
    if num_inliers_best < num_inliers
        num_inliers_best = num_inliers;
        center_best = center;
        radius_best = radius;
        inliers_best = inliers;
        index_best = index;
    end
    
    %% update N according to the strategy in the slides
    % implement this: find fraction of outliers
    eps = 1-num_inliers/size(edge_points,2);
    if (current_iter ==0)
        eps = 1-p;
    end
   
    % implement this: compute N
    
    N = log10(1-p)/log10(1-power(1-eps,3));
    
    current_iter = current_iter+1;
end

figure(1);
hold on;
draw_circle(center_best, radius_best);
plot(inliers_best(1, :), inliers_best(2, :), '.c');

edge_points(:,index_best) = [];

end
