% Given a set of 2D points in a 2 x N array, this function performes a least
% squares fit of the points to an algebraic formulation of the circle.
% Optionally, the circle is drawn into the active axes.
function [center, radius] = fit_circle(points, draw)
    if ~exist('draw', 'var')
        draw = false;
    end
    
    N = size(points, 2);
    x_avg = mean(points(1, :));
    y_avg = mean(points(2, :));
    u = points(1, :) - x_avg;
    v = points(2, :) - y_avg;
    
    % See http://www.dtcenter.org/met/users/docs/write_ups/circle_fit.pdf for a
    % derivation of the following.
    Suu = u * u';
    Svv = v * v';
    Suv = u * v';
    Suuu = u .^ 2 * u';
    Svvv = v .^ 2 * v';
    Suvv = u * (v .^ 2)';
    Svuu = v * (u .^ 2)';

    M = [Suu, Suv; Suv, Svv];
    if cond(M) > 1e6
        center = [-1; -1];
        radius = -1;
        return;
    end
    center = M \ (0.5 * [Suuu + Suvv; Svvv + Svuu]);
    radius = sqrt(center' * center + (Suu + Svv) / N);
    center = center + [x_avg; y_avg];
    
    if draw
        draw_circle(center, radius);
        hold on;
        plot(points(1, :), points(2, :),'o', 'MarkerEdgeColor', 'g', 'MarkerSize', 3);
        plot(center(1, 1), center(2, 1),'o', 'MarkerSize', 5);
        hold off;
    end
end
