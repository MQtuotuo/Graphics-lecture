%%Group 26
% Group members on Tue. 16:00-17:15: 
% Ming Qu
% Liuhan Pan

function h = draw_circle(x, r, outline_color, line_width)
    if ~exist('outline_color', 'var')
        outline_color = 'r';
    end
    
    if ~exist('line_width', 'var')
        line_width = 3;
    end
    
    % resolution
    res = 40;
    radians = linspace(0, (2 - 2 / res) * pi, res);
    unit_circle = [sin(radians); cos(radians)];
    
    % extend r if necessary
    if length(r) < size(x, 2)
        r = [r repmat(r(length(r)), 1, size(x, 2) - length(r))];
    end
    
    h = [];
    for i = 1 : size(x, 2)
        y = unit_circle * r(i) + repmat(x(:, i), 1, res);
        h = [h, plot(y(1, [1 : end, 1]), y(2, [1 : end, 1]), 'Color', outline_color, ...
            'LineWidth', line_width)];
    end
end
