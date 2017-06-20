%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan


% GenSamples function; part of the importance sampling exercise
% Uses rejection sampling to generate samples
% n: amount of samples to generate
% d: distribution to draw samples from
% max: maximum y value that is used to generate the samples
% returns: x and y values of the samples in the shape (n, 2)

function [s] = GenSamples(n, d, max)
	s = zeros(n, 2);
    i=1;
    while i<=n
    x=4*rand;
    y=d(x);
    max_y=max*rand;
    if max_y<=y
        s(i,:)=[x max_y];
        i=i+1;
    end
    end       
end
