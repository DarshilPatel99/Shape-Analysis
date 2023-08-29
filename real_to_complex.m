load("plane_data.mat");
plane_points = zeros(51,56);
for i = 1:56
   plane_points(:,i) = complex(final{i}(:,1),final{i}(:,2));
end
save("mylandmarks.mat","plane_points");
figure;
plot(real(plane_points(:,45)),imag(plane_points(:,45)))

one = ones(51,1);
centroids = (plane_points' * one)/51;
centered_plane_points = plane_points - centroids';
% save("mylandmarks.mat","centered_plane_points");
figure;
plot(real(centered_plane_points(:,45)),imag(centered_plane_points(:,45)));

norm_of_planes = vecnorm(centered_plane_points);
unit_plane_points =  centered_plane_points ./ norm_of_planes;
% save("mylandmarks.mat","unit_plane_points");
figure;
plot(real(unit_plane_points(:,45)),imag(unit_plane_points(:,45)));

save("my_personal_landmarks.mat","plane_points","centered_plane_points","unit_plane_points");

