%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    ransac_iteration.m                                     %
%    Program developed by:     Francisco Azevedo (80966)    %
%                              Lu�s Almeida ()              %
%                              Francisco Pereira ()         %
%    At IST, Lisbon 2017                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [R, T, P1, P2, subset, error] = ransac_iteration(matches, imd1, f1, PP1, imd2, f2, PP2, nmatches)
    
    % Get a subset "Y" of size 4 from "matches" (coordinates of cols are on Y)
    [subset, Y] = vl_colsubset(matches,4);
    
    ret = createPs( subset, imd1, f1, imd2, f2);

    P1 = ret.P1 +  % noise_factor * rand(3,size(subset,2)) TEST NOISE
    P2 = ret.P2 +  % noise_factor * rand(3,size(subset,2))  
    
    % c � Translation component
    % T � Orthogonal rotation and reflection component
    % b � Scale component

    [sum_error,transf_points,transf_matrix] = procrustes(P1,P2,'scaling',false,'reflection',false);

    xyz_2_to_1 = (PP2*transf_matrix.T)+ ones(length(PP2),1)*(transf_matrix.c(1,:));
    
end