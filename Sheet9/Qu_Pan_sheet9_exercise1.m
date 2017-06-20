%% Group members: Liuhan Pan; Ming Qu
%%%******Press "enter" to show the procedures of the algorithms********

%% 
clear all
P1 = [ 1; 2 ];
P2 = [ 3; 5 ];
P3 = [ 5; 4 ];
P4 = [ 7; 2];
P5=[ 9; 4];
P=[P1 P2 P3 P4 P5];


%%plot the control points
Hl = plot(P(1, :), P(2, :));
set(Hl, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-')
axis equal, axis off
ht = title('The algorithm of De Casteljau');
set(ht, 'FontSize', 14)
hold on
text(1,2, 'P_1')
text(3,5, 'P_2')
text(5,4, 'P_3')
text(7,2, 'P_4')
text(9,4, 'P_5')


%%calculate and plot Bezier curve
t  = 0: 0.02: 1;                % parameter
C1 = (1 - t).^4;                % Bernstein polynomials
C2 = 4*t.*(1 -t).^3;
C3 = 6*t.^2.*(1 -t).^2;
C4 = 4*(1-t).*t.^3;
C5 = t.^4;
C  = [ C1; C2; C3; C4;C5 ];
B  = P*C;
H2 = plot(B(1, :), B(2, :));
set(H2, 'LineWidth', 1.5, 'Color','k', 'LineStyle', '-')
hp1 = plot([ ], [ ]);
hp2 = plot([ ], [ ]);
hp3 = plot([ ], [ ]);
pause


% loop over t
for t = 0.1: 0.1: 0.9;          % begin loop
% first interpolation;
P12 = (1 -t)*P1 + t*P2;
P23 = (1 -t)*P2 + t*P3;
P34 = (1 -t)*P3 + t*P4;
P45 = (1 -t)*P4 + t*P5;
hp1 = plot([P12(1) P23(1) P34(1) P45(1)], [P12(2) P23(2) P34(2) P45(2)], 'b-', 'LineWidth', 0.5);
% second interpolation
P123 = (1 -t)*P12 + t*P23;
P234 = (1 -t)*P23 + t*P34;
P345 = (1 -t)*P34 + t*P45;
hp2  = plot([ P123(1) P234(1) P345(1)], [ P123(2) P234(2) P345(2)], 'g-', 'LineWidth', 0.5);
% third interpolation
P1234 = (1 -t)*P123 + t*P234;
P2345 = (1 -t)*P234 + t*P345;
hp3=plot([P1234(1) P2345(1)],[P1234(2) P2345(2)], 'y-', 'LineWidth', 0.5);
% forth interpolation
P = (1 -t)*P1234 + t*P2345;
plot(P(1), P(2), 'd')
pause
end

hold off