%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    peopletracking.m                                       %
%    Program developed by:     Francisco Azevedo (80966)    %
%                              Lu�s Almeida ()              %
%                              Francisco Pereira ()         %
%    At IST, Lisbon 2017                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function objects = track3D_part1(imgseq1, imgseq2, cam_params, cam1toW, cam2toW)

%Get Foreground in depth points for both cameras

[foreground_depth1, foreground_img1] = fg_detect( RGB_PATH1, RGB_PATH2, DEPTH_PATH1, DEPTH_PATH2);
[foreground_depth2, foreground_img2] = fg_detect(RGB_PATH1, RGB_PATH2, DEPTH_PATH1, DEPTH_PATH2);

%Correspond those points into 3D


%Draw a 2D box around it

%Draw 3D around it and fix having it projected into the BG

%Using SIFT to get correspondence between points in RGB

%Get respective points in X,Y,Z

%Run RANSAC to eliminate outliers

%Drawing box around object and storing data

%Making correspondence between current and last image

end