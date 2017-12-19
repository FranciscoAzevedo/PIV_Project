% function [ obj_cam ] = get_objects_3D(labels, fg_depth, xyz_cam)
    label_num = 1;
    obj_cam = [];
    
    % Find the rows and columns of pixels of a specific object
    [r,c] = find(labels == label_num);
    
    while( isempty(r) == 0 || isempty(c) == 0)
    
        % Get the 3D points corresponding to "r" and "c"
        obj_cam(label_num).xyz = xyzd1(sub2ind([480 640],round(r),round(c)),:);
        
        % Get the centroid of these points
        [idx,C] = kmeans(obj_cam(label_num).xyz,1);
        obj_cam(label_num).centroid = C;
        
        label_num = label_num + 1;
        
        % Find the rows and columns of pixels of a specific object
        [r,c] = find(labels == label_num);
        
    end
    
%     pc1 = pointCloud(xyzd1);
%     showPointCloud(pc1);
%     hold on;
    
    pc2 = pointCloud(obj_cam(1).xyz);
    showPointCloud(pc2);
    hold on;
    
    scatter3(obj_cam(1).centroid(1),obj_cam(1).centroid(2),obj_cam(1).centroid(3),'*r');
% end

