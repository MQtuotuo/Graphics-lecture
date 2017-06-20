function draw_axes()
    
    % plot three lines from the origin along the axes
    plot3([0; 1], [0; 0], [0; 0], 'LineWidth', 2, 'color', 'black');
    plot3([0; 0], [0; 1], [0; 0], 'LineWidth', 2, 'color', 'black');
    plot3([0; 0], [0; 0], [0; 1], 'LineWidth', 2, 'color', 'black');
    % and some markers at their end
    scatter3(1, 0, 0, 100, 'red', 'MarkerFaceColor', 'red');
    scatter3(0, 1, 0, 100, 'green', 'MarkerFaceColor', 'green');
    scatter3(0, 0, 1, 100, 'blue', 'MarkerFaceColor', 'blue');
    
    % equally stretched axes
    axis equal;
    
    % define bounding box
    axis([-8 8 -8 8 -2 8]);
    
    % assign labels to the axis
    xlabel('x');
    ylabel('y');
    zlabel('z');
end
