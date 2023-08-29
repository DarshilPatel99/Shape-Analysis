load("mylandmarks.mat");

mean_explicit_shape = mymean_explicit(unit_plane_points);
theta = angle(mean_explicit_shape(1)) - (pi/2);
mean_explicit_shape = complex(cos(-theta),sin(-theta))*mean_explicit_shape

[n,m] = size(unit_plane_points);
    mean_iterative_shape = unit_plane_points(:,1);
    difference = 1;
    count = 0
    figure;
    while difference > 0.001
        %align all landmark points
        % unit_plane_points = (unit_plane_points' * mean_iterative_shape)' .* unit_plane_points;
        
        temp_mean_shape = sum(unit_plane_points,2);
        temp_mean_shape = temp_mean_shape/vecnorm(temp_mean_shape);
        difference = vecnorm(mean_iterative_shape-temp_mean_shape);
        disp(difference);
        mean_iterative_shape = temp_mean_shape;
        count = count + 1;
        hold on;
        %plot(real(mean_iterative_shape),imag(mean_iterative_shape),'x--');
        %daspect([1 1 1]);
    end
    disp(count)
    
    theta = angle(mean_iterative_shape(1)) - (pi/2);
    mean_iterative_shape = complex(cos(-theta),sin(-theta))*mean_iterative_shape;
    
    plot(real(mean_iterative_shape),imag(mean_iterative_shape),'x--');
    hold on;
    
    
    
    
