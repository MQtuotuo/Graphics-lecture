

% Part a)

close all;clear all
limit = 1e4;
plotAt = limit/10; % the iteration at which we want to see the plot
% center/radius of the circle
center = [0 0]';
radius = 3;
% reference values:
figure, hold on, axis equal
phi=0:0.01:2*pi;
x_c=radius*cos(phi)+center(1);
y_c=radius*sin(phi)+center(2);
plot(x_c,y_c,'b-','erasemode','none','linewidth',3), alpha(0.8);
fill(x_c,y_c,'w');
drawnow
area_circle = pi*radius^2;
h = waitbar(0,'Please wait...');
area_approx = zeros(1,limit);
for N_points=1:1:limit
    
    waitbar(N_points/limit,h);
    % randomly select N_points 2D points in the enclosing rectangle
    point_coords= -3+6*rand(2,N_points);
    x=point_coords(1,:);
    y=point_coords(2,:);
    % calculate the radii for all of the points
    Rsquare = sqrt(x.^2+y.^2);
    
    % check which points are inside
    check = Rsquare<=3;
    
    % count inliers
    inside_counter = sum(check);% total number of interior points
    
    % approximate area
    area_approx(N_points) =36*inside_counter/N_points;
    
    % show a plot
    if (N_points==plotAt)
        % find inlier/outlier
        [inlier_idx] = find(check);
        [outlier_idx] = find(~check);
        % plot inlier/outlier
        plot(point_coords(1,inlier_idx),point_coords(2,inlier_idx),'g.');
        plot(point_coords(1,outlier_idx),point_coords(2,outlier_idx),'r.');
    end
end
close(h)

% calculate the error for different numbers of points
error =(area_approx-area_circle)/area_circle ;
% plot the error
figure; plot(error);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%




% Part b)


clear;
% number of random chosen points
limit=1e4;
plotAt = limit/10; % the iteration at which we want to see the plot

% center/radius of the sphere
center = [0 0 0]';
radius = 3;
% reference values:
volume = 4/3*pi*radius^3;
[X,Y,Z] = sphere(100);
X = radius*X+center(1);
Y = radius*Y+center(2);
Z = radius*Z+center(3);
figure;
surf(X,Y,Z), alpha(0.5);
axis equal, shading interp, hold on


h = waitbar(0,'Please wait...');

volume_approx = zeros(1,limit);

for N_points=1:1:limit
    
    waitbar(N_points/limit,h);

    % randomly select N_points 2D points in the enclosing rectangle
    point_coords= -3+6*rand(3,N_points);
    x=point_coords(1,:);
    y=point_coords(2,:);
    z=point_coords(3,:);
    % calculate the radii for all of the points
    Rsquare =  sqrt(x.^2+y.^2+z.^2);
    
    % check which points are inside
    check = Rsquare<=3;
    inside_counter =sum(check);% total number of interior points
    
    % approximate volume
    volume_approx(N_points) = 216*inside_counter/N_points;
    
    % show a plot
    if  (mod(N_points,plotAt) == 0)
        % find inlier/outlier
        [inlier_idx] = find(check);
        [outlier_idx] = find(~check);
        % plot inlier/outlier
        plot3(point_coords(1,inlier_idx),point_coords(2,inlier_idx),point_coords(3,inlier_idx),'g.');
        plot3(point_coords(1,outlier_idx),point_coords(2,outlier_idx),point_coords(3,outlier_idx),'r.');
    end

end

close(h)

% calculate the error for different numbers of points
error_volume = (volume_approx-volume)/volume;

% plot the error
figure; plot(error_volume);
