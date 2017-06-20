%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

clear all; close all;

% f: target function, which we want to integrate
f=@(x)(x.^0.9).*exp(-x.^2/2);
p_u=@(x) 1/4;
% p_n: normal distribution for samples
sigma2 = 0.3;
mu = 1.2;
p_n=@(x) exp(-(mu-x).^2/(2*sigma2))/sqrt(2*pi*sigma2);


% p_p: polynomial fit of the target function
px=0:4;
py=px.^0.9.*exp(-px.^2/2);
p=polyfit(px,py,4);
p_p=@(x)polyval(p, x);

%% p_u is a constant line, p_n is not so like the f,and p_p is most the same with f
%%

% plot the function graphs:
% ...
h1=ezplot(f,[0 4]);
set(h1,'color','r') 
hold on
h2=ezplot(p_n,[0 4]);
set(h2,'color','g') 
h3=ezplot(p_p,[0 4]);
set(h3,'color','b') 
title('Three graph');


% Plot results of GenSamples()
% Hint: 0.8 is a reasonable value for the max parameter of GenSample
max=0.8;
n=200;

s_n = GenSamples(n, p_n, max);
figure
ezplot(p_n,[0 4]);
hold on
scatter(s_n(:,1),s_n(:,2))
title('Normal Distribution');

s_p = GenSamples(n, p_p, max);
figure
ezplot(p_p,[0 4]);
hold on
scatter(s_p(:,1),s_p(:,2))
title('Polynomial');

maximumSamples = 500;
id = zeros(maximumSamples, 1);
norm = zeros(maximumSamples, 1);
poly = zeros(maximumSamples, 1);

h = waitbar(0, 'Please wait...');
for i = 1:maximumSamples
	samples=4*rand(i,1);
    
    id(i) =Integrate(f,p_u,samples);
	norm(i) =Integrate(f,p_n,samples);
    poly(i) =Integrate(f,p_p,samples);
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

%% The Normal Distribution is totally different from another two, may be
% because the normal function might quite differ from the function.
%%
%density function----area must be one
%must use probability function
%