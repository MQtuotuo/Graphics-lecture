% GenSamples function; part of the importance sampling exercise


% Uses rejection sampling to generate samples
% n: amount of samples to generate
% d: distribution to draw samples from
% max: maximum y value that is used to generate the samples
% returns: x and y values of the samples in the shape (n, 2)
function [s] = GenSamples(n, d,max)
	s = zeros(n, 2);
    x=4*rand(1000,1);
    py=max*rand(1000,1);
    k=1;
    i=1;
    while (k<=200&&i<=1000)
        dy=d(x(i)); 
            if(py(i)<=dy)
                s(k,1)=x(i);
                s(k,2)=py(i);
                k=k+1;
             end
             i=i+1;
    end
end

