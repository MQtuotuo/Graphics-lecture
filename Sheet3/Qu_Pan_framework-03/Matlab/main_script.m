% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

close all;
clear all;
y0=[-1;3;4]; % the start position

%% Euler integration scheme for the lorenz attractor
figure()
[y_euler] = euler(@lorenz_attractor, y0, 0.025, 3000);
y_euler = y_euler';
plot3(y_euler(:,1),y_euler(:,2),y_euler(:,3));  % Plot results
title('Lorenz Attractor Euler Method');
grid on;

%% 4-th order Runge Kutta integration scheme for the lorenz attractor
[y_rk] = runge_kutta_4th_order(@lorenz_attractor, y0, 0.025, 3000);
y_rk = y_rk';
figure()
plot3(y_rk(:,1), y_rk(:,2), y_rk(:,3));  % Plot results
title('Lorenz Attractor 4th Order Runge Kutta');
grid on;

%% Matlab ODE solver
[t,Y] = ode45(@lorenz_attractor, [0, 0.025*3000], y0); %Invoking built-in solver 'ode45'
figure;
plot3(Y(:,1), Y(:,2), Y(:,3));  % Plot results
title('Lorenz Attractor Matlab ODE solver');
grid on;
axis equal

%% plot results in a common coordinate frame
figure()
hold on; grid on; axis equal;
plot3(y_euler(:,1), y_euler(:,2),y_euler(:,3),'b');
plot3(y_rk(:,1), y_rk(:,2), y_rk(:,3),'r');
plot3(Y(:,1), Y(:,2), Y(:,3),'g');
legend('Euler method','Runge-Kutta method','Matlab ode45')
title('Comparison of all methods');
