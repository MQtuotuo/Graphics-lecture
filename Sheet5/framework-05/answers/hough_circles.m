function [ accumulator ] = hough_circles( edge_map, hough_radii )
%hough_circles Summary of this function goes here
%   Detailed explanation goes here
xSize = length(edge_map);
ySize = length(edge_map(:,1));
accumulator = zeros(xSize, ySize, length(hough_radii));
minX = 0;
maxX = 0;
minY = 0;
maxY = 0;
for i = 1:xSize
    for j = 1:ySize
        if edge_map(j, i) == 1
            for r = hough_radii
                index = r-hough_radii(1)+1;
                for rad = 0:0.05:2*pi
                    a = round(i - r * cos(rad))+1;
                    b = round(j - r * sin(rad))+1;
                    if( xSize >a && a > 0 && b > 0 && ySize > b)
                        accumulator(a,b,index) = 1+accumulator(a,b,index);
                    elseif minX >a
                        minX = a;
                    elseif minY >b
                        minY = b;
                    elseif maxX <a
                        maxX = a;
                    elseif maxY <b
                        maxY = b;
                    end
                end
            end
        end
    end
end

