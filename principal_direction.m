close all;
clear all;
load("my_personal_landmarks.mat");
load("mean_shapes.mat");

unit_plane_points = (unit_plane_points' * mean_explicit_shape)' .* unit_plane_points;
cp_mu = unit_plane_points - mean_explicit_shape;

C = cp_mu*(cp_mu');

[V,vars] = eigs(C,4);

%{
(V(:,1)') * V(:,2)
(V(:,2)') * V(:,3)
(V(:,1)') * V(:,3)

(V(:,1)') * V(:,1)
(V(:,2)') * V(:,2)
(V(:,3)') * V(:,3)
%}

for i = 1:4
    figure;
    for k = -0.3:0.1:0.3
        mu_kv = mean_explicit_shape + (k * V(:,i));
        hold on;
        plot(real(mu_kv),imag(mu_kv))
        daspect([1 1 1]);
    end
    title("variation captured by v"+num2str(i))
    name = "varience_along_with_v"+num2str(i)+".jpg"
    saveas(gcf,name,'jpg')
end
disp(vars)

vars = sort(eig(C),'descend')
cum_vars = cumsum(vars);
figure;
plot(1:51,(cum_vars./cum_vars(end)))
title("number of eigenvalues vs the fraction of variance")
saveas(gcf,'number_of_eigenvalues_versus_the_fraction_of_variance.jpg','jpg')
