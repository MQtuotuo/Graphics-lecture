clear all; close all;


% f: target function, which we want to integrate
f=@(x) x.^0.9.*exp(-x.^2/2);

pu=@(x) 1/4;
% p_n: normal distribution for samples
sigma2 = 0.3;
mu = 1.2;
pn=@(x) exp(-(mu-x).^2/(2*sigma2))/sqrt(2*pi*sigma2);


% p_p: polynomial fit of the target function
 px=0:4;
 py=px.^0.9.*exp(-px.^2/2);
 p=polyfit(px,py,4);
 pp=@(x) polyval(p,x);
 
% plot the function graphs:
% pu is a constant line, pn is not so like the f,and pp is most the same
% with f
h1=ezplot(f,[0 4]);
set(h1,'color','r') 
hold on
h2=ezplot(pn,[0 4]);
set(h2,'color','g') 
h3=ezplot(pp,[0 4]);
set(h3,'color','b') 
legend('Function','Normal Distribution','Polynomial'); 
title('Three graph');


% Plot results of GenSamples()
% Hint: 0.8 is a reasonable value for the max parameter of GenSamples
[s] = GenSamples(200, pn,1);
figure()
ezplot(pn,[0 4]);
hold on
scatter(s(:,1),s(:,2))
title('Normal Distribution');
[s2] = GenSamples(200, pp,1);
figure()
ezplot(pp,[0 4]);
hold on
scatter(s2(:,1),s2(:,2))
title('Polynomial');


%Integrate f using the three dierent distributions
maximumSamples = 500;
id = zeros(maximumSamples, 1);
norm = zeros(maximumSamples, 1);
poly = zeros(maximumSamples, 1);

h = waitbar(0, 'Please wait...');
for i = 1:1:maximumSamples
    samples=4*rand(i,1);
    id(i) =Integrate(f,pu,samples);
	norm(i) =Integrate(f,pn,samples);
    poly(i) =Integrate(f,pp,samples);
    waitbar(i/maximumSamples, h);
end
close(h)

%plot results
figure()
h1=plot(id);
set(h1,'color','r') 
hold on
h3=plot(poly);
set(h3,'color','b') 
legend('Uniform Distribution','Polynomial'); 
title('Two distributions');
figure()
h2=plot(norm);
title('Normal Distribution')


% The Normal Distribution is totally different from another two, may be
% because the normal function might quite differ from the function. 