%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

close all; clear;

%% read image
img = imread('../coins.png');
% convert to gray scale
img = mean(img, 3);
img = img / max(img(:));

% display image

figure(1);
imshow(img);

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
for i=1:10 % ten coins

% minimum sample size for initial model fitting of a circle
s = 3;
% maximum number of RANSAC iterations
max_iters = 10;
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

current_iter = 0;
N = max_iters;


% start RANSAC iterations *in fact it's not really random)
while current_iter < max_iters && current_iter < N
    fprintf('iter %d, N = %d\n', current_iter, N);
    %% draw initial sample points:
    
    % implement this: pick s edge points at random
    initial_samples = datasample(edge_points, s, 2, 'Replace',false);
    
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
    j=1;
    for ki=1:1:num_points
    distance_to_center = sqrt((edge_points(1,ki)-center(1,1))^2+(edge_points(2,ki)-center(2,1))^2);
      
    if distance_to_center<=(radius+distance_threshold)&&distance_to_center>=(radius-distance_threshold)&&j<=num_points;
            inliers(1,j) = edge_points(1,ki);
            inliers(2,j) = edge_points(2,ki);
           
            j=j+1; 
    end
    end
    num_inliers = size(inliers, 1);

    
    %% we optionally re-fit the model parameters if we have enough inliers
    [center, radius] = fit_circle(inliers);
    
    % count the inliers:
    num_inliers = size(inliers, 2);
    
    %% did we find a better model than the previous one?
    if num_inliers_best < num_inliers
        num_inliers_best = num_inliers;
        center_best = center;
        radius_best = radius;
        inliers_best = inliers;
    end
    
    %% update N according to the strategy in the slides
    % implement this: find fraction of outliers
    eps = 1-(num_inliers_best)/num_points;
    
    % implement this: compute N
    N = log10(1-p)/log10(1-(1-eps)^s);
    current_iter = current_iter+1;
    
end

figure(1);
hold on;
draw_circle(center_best, radius_best);

plot(inliers_best(1, :), inliers_best(2, :), '.c');

%delete 
edge_points[];

end
