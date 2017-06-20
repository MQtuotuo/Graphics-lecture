% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

function [x] = euler(f, y0, stepsize, steps)
% function for solving an ordinary differential equation of the form
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

% use Euler?s method to update the value of x at new time steps.
for i = 1 : steps
t(i+1) = t(i) + stepsize;
x(:,i+1) = x(:,i) + stepsize * feval ( f, t(i), x(:,i) );
                                                        
end