%FUSE_2_PC Fuses two point clouds into world reference frame
%   Inputs: 2 RGB+D images
%   Outputs: 1 PC in World Frame
%   Description: Given RGB+D from camera 1 project point cloud w/colours
%                Do the same for camera 2. Transform both cameras local 
%                Coordinate frame into world frame and fuse into 1 PC w/colour

clear all; clc;

% Loading RGB+D image
load('calib_asus.mat');

depth_1 = load('depth1_1.mat');
rgb_1 = imread('rgb_image1_1.png');
depth_2 = load('depth2_1.mat');
rgb_2 = imread('rgb_image2_1.png');

figure(1);
imagesc([rgb_1 rgb_2]);
figure(2);
imagesc([depth_1.depth_array depth_2.depth_array]);

% Getting XYZ coordinates from depth file
xyz_1 = get_xyz_asus(depth_1.depth_array(:),[480 640],1:640*480, Depth_cam.K ,1,0);
xyz_2 = get_xyz_asus(depth_2.depth_array(:),[480 640],1:640*480, Depth_cam.K ,1,0);

% colour_xy: x is camera number, y is picture sequence number
colour_l1 = reshape(rgb_1, 480*640,3);
colour_21 = reshape(rgb_2, 480*640,3);

% Projecting colour into the XYZ coordinates making it a coloured PC
pc1 = pointCloud(xyz_1, 'Color', colour_l1);
pc2 = pointCloud(xyz_2, 'Color', colour_21);

% Showing results so far
figure(3)
showPointCloud(pc1);
figure(4)
showPointCloud(pc2);

% Getting the cam_to_W.R and cam_to_W.T for both cameras



% Transforming local coordinate frame into world coordinate fram
xyzt_1 = (R_d_to_rgb *(xyz_1'))'; % 3x3 x 3xN -> 3xN + 3xN
xyzt_2 = (R_d_to_rgb *(xyz_2'))'; % 3x3 x 3xN -> 3xN + 3xN

% Merging 2 Point Clouds based on points already in world coord frame
ptotal = pointCloud([xyzt_1 ; xyzt_2],'Color',[colour_l1; colour_21]);
figure(5);
showPointCloud(ptotal);
