% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

function [x] = runge_kutta_4th_order(f, y0, stepsize, steps)
% Function for solving a differential equation dot(x)=f by using the 4th order Runge-Kutta method
% Input:	function f
%			initial value y0
%			stepsize
%			amount of steps
% output:
%			the positions x on the path that were computed

x = zeros(3, steps);

t_range=[0, stepsize*steps];
t(1) = t_range(1);
x(:,1) = y0;

%Runge-Kutta order-4 method function
for i = 1 : (steps-1)
t(i+1) = t(i) + stepsize;
k1 = feval(f, t(i), x(:,i));
k2 = feval(f, t(i)+0.5*stepsize, x(:,i)+0.5*stepsize*k1);
k3 = feval(f, t(i)+0.5*stepsize, x(:,i)+0.5*stepsize*k2);
k4 = feval(f, t(i)+stepsize, x(:,i)+stepsize*k3);
x(:,i+1) = x(:,i) + (1/6)*(k1+2*k2+2*k3+k4)*stepsize;  % main equation
end
