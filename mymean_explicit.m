function [mean_explicit_shape] = mymean_explicit(unit_plane_points)
    S = unit_plane_points * unit_plane_points';
    [mean_explicit_shape,lembda] = eigs(S,1);



