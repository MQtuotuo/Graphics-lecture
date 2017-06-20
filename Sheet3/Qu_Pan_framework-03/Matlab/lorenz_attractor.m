% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

function dxdt=lorenz_attractor(t, x)
% Evaluates the right hand side of the Lorenz system
% x' = sigma*(y-x)
% y' = x*(rho - z) - y
% z' = x*y - beta*z
% typical values: rho = 28; sigma = 10; beta = 8/3;
     dxdt = zeros(3,1);
     dxdt(1) = 10*(x(2) - x(1));
     dxdt(2) = x(1)*(28 - x(3)) - x(2);
     dxdt(3) = x(1)*x(2) - 8/3*x(3);
end
