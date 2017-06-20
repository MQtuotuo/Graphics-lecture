close all; clear;
B = zeros(4,4);  
C = zeros(size(B,1), size(B,2), 4);
%% read image
img = imread('../coins.png');
% convert to gray scale
img = mean(img, 3);
img = img / max(img(:));

% display image
figure; imshow(img);

%% get edge map
edge_map = edge(img, 'canny');

% display edge image
figure; imshow(edge_map);

% store the edge points
[edgepoints(2, :), edgepoints(1, :)] = find(edge_map ~= 0);

% plot edge points into figure 1
figure(1);
%hold on;
plot(edgepoints(1, :), edgepoints(2, :),'.b');
%% fit circles using Hough transform
% total number of circles to extract

last = 70;
% range of radii to look for in Hough space
hough_radii = 20 : 70;
hough_radii2 = 21:70;

% Implement a function that, given an edge image and a range of radii, performs
% the Circular Hough Transform to create an accumulation array containing the
% votes for circles centered at the specific pixel and with a specific radius.
acc = hough_circles(edge_map, hough_radii);

%%

% Implement a function that, given an edge image and a range of radii, performs
% the Circular Hough Transform to create an accumulation array containing the
% votes for circles centered at the specific pixel and with a specific radius.
acc = hough_circles(edge_map, hough_radii);


%% let's inspect the accumulation array by displaying some slices
% Implement this function for displaying four different slices for specific
% radii from the accumulation array. The first argument is the Hough
% accumulation array, the second argument is the same range of radii that was
% used to create the acculuation array.


for i = 1:4
    ns = round(rand(1)*length(hough_radii));
    q = zeros(length(edge_map(:,1)),length(edge_map));

    qq = zeros(length(edge_map(:,1)),length(edge_map));
    qq(:,:,1) = q;
    qq(:,:,2) = q;

    m = max(max(acc(:,:,ns)));
    qq(:,:,3) = round(acc(:,:,ns).*255./(m/2)).'+80;
    qq = uint8(qq);

    figure()
    imshow(qq);
    
end






%% extract circle parameters at local maxima in Hough space
% implement this: find local maxima in the Hough accumulation array acc and
% extract the corresponding circle parameters (i.e. center x- & y-coordinate and
% radius) as well as each circle's voting score 


circleRadiuses = [];

firstRMinusOne = hough_radii(1)-1;

localMaximas = [];

lengthX = length(acc)-1;
lengthY=length(acc(1,:,1))-1;

mask = true(lengthX+2,lengthY+2,3);

maxes = imregionalmax(acc);

zeroesremoved = maxes.*acc;

maximalist = [ ;];

for i = hough_radii-hough_radii(1)+1
    [xs ys vs] = find(zeroesremoved(:,:,i));
    rs = ones(length(xs),1).*i;
    m = [xs ys  rs vs];
    maximalist = [maximalist;m];
end



filtered = maximalist(maximalist(:,4)>65,:);


img = imread('../coins.png');
figure();
imshow(img);
hold on
for i = 1:length(filtered)
    row = filtered(i,:);
    circle(row(1), row(2), row(3)+hough_radii(1)-1);
end

% this should become a (num_circles x 2) array, storing the center coordinates in its colums
centers = filtered(:,1:2);
% an array with num_circles elements specifying the radius of each circle
radii = filtered(:,3)+hough_radii(1)-1;
% an array with num_circles elements storing the voting score for each circle
scores = filtered(:,4);


% implement this: find maximum in the parameter space (and with it the center)
% ...

% display circle
