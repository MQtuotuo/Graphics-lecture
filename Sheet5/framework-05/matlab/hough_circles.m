function acc = hough_circles(edge_map, hough_radii)
%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan


[m,n] = size(edge_map); 
size_r =size(hough_radii,2);  
size_angle = round(2*pi);  
acc = zeros(m,n,size_r);    
[rows,cols] = find(edge_map);  
ecount = size(rows);  
for i=1:ecount  
    for r=1:size_r  
        for k=1:size_angle  
            a = round(rows(i)-(hough_radii(1)+(r-1))*cos(k));  
            b = round(cols(i)-(hough_radii(1)+(r-1))*sin(k));  
            if(a>0&a<=m&b>0&b<=n)  
              acc(a,b,r) = acc(a,b,r)+1;  
            end  
        end  
    end  
end


end