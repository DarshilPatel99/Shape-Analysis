function [mean_iterative_shape] = mymean_iterative(unit_plane_points)
    [n,m] = size(unit_plane_points);
    mean_iterative_shape = unit_plane_points(:,1);
    difference = 1;
    error = 100;
    while difference > 0.001
        %align all landmark points
        temp_unit_plane_points = (unit_plane_points' * mean_iterative_shape)' .* unit_plane_points;
        
        temp_mean_shape = sum(temp_unit_plane_points,2);
        temp_mean_shape = temp_mean_shape/vecnorm(temp_mean_shape);
        difference = vecnorm(mean_iterative_shape - temp_mean_shape);
        mean_iterative_shape = temp_mean_shape;
        if error == difference
           break;
        else
            error = difference;
        end
    end
    