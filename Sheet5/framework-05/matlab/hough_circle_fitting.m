close all; clear;

%% read image
img = imread('../coins.png');
%img = imread('/coins.png');
% convert to gray scale
img = mean(img, 3);
img = img / max(img(:));

% display image
%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

figure; imshow(img);

%% get edge map
edge_map = edge(img, 'canny',0.5);

% display edge image
figure; imshow(edge_map);

% store the edge points
[edgepoints(2, :), edgepoints(1, :)] = find(edge_map ~= 0);

% plot edge points into figure 1
figure(1);
hold on;
plot(edgepoints(1, :), edgepoints(2, :),'.b');

%% fit circles using Hough transform
% total number of circles to extract
num_circles = 10;

% range of radii to look for in Hough space
hough_radii = 20 : 70;

% Implement a function that, given an edge image and a range of radii, performs
% the Circular Hough Transform to create an accumulation array containing the
% votes for circles centered at the specific pixel and with a specific radius.
acc = hough_circles(edge_map, hough_radii);

%% let's inspect the accumulation array by displaying some slices
% Implement this function for displaying four different slices for specific
% radii from the accumulation array. The first argument is the Hough
% accumulation array, the second argument is the same range of radii that was
% used to create the acculuation array.
radii=[1 7 41 69];
drawslice(acc,radii)
%% extract circle parameters at local maxima in Hough space
% implement this: find local maxima in the Hough accumulation array acc and
% extract the corresponding circle parameters (i.e. center x- & y-coordinate and
% radius) as well as each circle's voting score 

[m,n] = size(edge_map);   
[rows,cols] = find(edge_map);  
ecount = size(rows);  
max_para = max(max(max(acc)));  
index = find(acc>=max_para*0.5);  
length = size(index);  
for k=1:length  
    par3 = floor(index(k)/(m*n))+1;  
    par2 = floor((index(k)-(par3-1)*(m*n))/m)+1;  
    par1 = index(k)-(par3-1)*(m*n)-(par2-1)*m;  
    par3 = 20+(par3-1);  
    para(:,k) = [par1,par2,par3]';  
end  


% this should become a (num_circles x 2) array, storing the center coordinates in its colums
centers = para(1:2,:);
% an array with num_circles elements specifying the radius of each circle
radii = para(3,:);
% an array with num_circles elements storing the voting score for each circle
scores = [];


% implement this: find maximum in the parameter space (and with it the center)
for i=1:ecount  
    for k=1:length  
        par3 = floor(index(k)/(m*n))+1;  
        par2 = floor((index(k)-(par3-1)*(m*n))/m)+1;  
        par1 = index(k)-(par3-1)*(m*n)-(par2-1)*m;  
        if((rows(i)-par1)^2+(cols(i)-par2)^2<(20+(par3-1))^2+5&&...  
                (rows(i)-par1)^2+(cols(i)-par2)^2>(20+(par3-1))^2-5)  
            hough_circle(rows(i),cols(i)) = 1;  
        end  
    end  
end  
figure(1);
hold on;
imshow(hough_circle)


