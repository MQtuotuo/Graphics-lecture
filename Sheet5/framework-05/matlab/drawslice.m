%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

function f=drawslice(acc,radii)
n=size(radii,2);
for i=1:n
    b=acc(:,:,radii(i));
    figure()
    imagesc (b)
    figure(gcf)
end
end