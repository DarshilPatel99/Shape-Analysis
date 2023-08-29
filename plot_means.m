load("my_personal_landmarks.mat");

mean_explicit_shape = mymean_explicit(unit_plane_points);
mean_iterative_shape = mymean_iterative(unit_plane_points);
save("mean_shapes" ,"mean_explicit_shape", "mean_iterative_shape")

figure;
plot(real(mean_explicit_shape),imag(mean_explicit_shape),'o--');
hold on;
plot(real(mean_iterative_shape),imag(mean_iterative_shape),'x--');
daspect([1 1 1]);
title("mean shape from both algorithms")
legend("explicit mean","iterative mean")
saveas(gcf,'explicit_iterative_mean.jpg','jpg')

%mean + 20 palne points
figure;
plot(real(mean_iterative_shape),imag(mean_iterative_shape),'x-','LineWidth',1.5);
for i = 35:50
    hold on;
    plot(real(unit_plane_points(:,i)),imag(unit_plane_points(:,i)),'.--');
end
title("mean and raw landmark pointset")
saveas(gcf,'mean_and_20_plane_points.jpg','jpg')


% rotate the mean shape to align
theta = angle(mean_explicit_shape(1)) - (pi/2);
mean_explicit_shape = complex(cos(-theta),sin(-theta))*mean_explicit_shape;

theta = angle(mean_iterative_shape(1)) - (pi/2);
mean_iterative_shape = complex(cos(-theta),sin(-theta))*mean_iterative_shape;


figure;
plot(real(mean_explicit_shape),imag(mean_explicit_shape),'o--');
hold on;
plot(real(mean_iterative_shape),imag(mean_iterative_shape),'x--');
daspect([1 1 1]);
title("aligned mean shapes")
legend("explicit mean","iterative mean")
saveas(gcf,'aligned_explicit_iterative_mean.jpg','jpg')


