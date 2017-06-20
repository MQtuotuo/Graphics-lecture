% Integrate function; part of the importance sampling exercise

% p: the function to integrate
% samples: array with the sample positions
% weights: function to compute the weight of each sample
function x = Integrate(f,p,samples)
sumw=0; 
n=size(samples,1);
for k=1:1:n
    weights= f(samples(k))./p(samples(k));
    sumw=sumw+weights;
    Fk=sumw/k; 
end
x=mean(Fk);