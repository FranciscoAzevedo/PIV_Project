%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    track3D_part2.m                                        %
%    Program developed by:     Francisco Azevedo (80966)    %
%                              Luis Almeida (81232)         %
%                              Francisco Pereira (81381)    %
%    At IST, Lisbon 2017                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function objects = track3D_part2(imgseq1, imgseq2, cam_params)

    [depth1,depth2,im1,im2,xyz1,xyz2,imd1,imd2] = setup_img(imgseq1, imgseq2, cam_params, 17);

    % Run RANSAC, SIFT and Procrustes to get R and T world
    [R,T,P1,P2] = get_T_R_world( im1, imd1, im2, imd2 )

    % Get foreground for both cameras
    [fg_depth1,fg_depth1_bin] = bg_fg_detect(imgseq1);
    [fg_depth2,fg_depth2_bin] = bg_fg_detect(imgseq2);

    % Label objects in 2D
    labels_1 = bwlabel(fg_depth1_bin);
    labels_2 = bwlabel(fg_depth2_bin);
    
    % Get PC and centroids for each object in each camera
    [obj_cam1]= get_objects_3D(labels_1,fg_depth1, xyz1);
    [obj_cam2]= get_objects_3D(labels_2,fg_depth2, xyz2);
    
    % Get the final cornerpoints for all objects
    [objects] = object_consensus(obj_cam1, obj_cam2, R, T);

    %Using SIFT to get correspondence between points in RGB
    %Making correspondence between current and last image

end