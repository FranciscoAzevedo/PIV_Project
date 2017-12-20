

function [ R , G , B ]=histograma_cores(Pointcloud_rgb)



R=imhist(Pointcloud_rgb(:,:,1),4);
G=imhist(Pointcloud_rgb(:,:,2),4);
B=imhist(Pointcloud_rgb(:,:,3),4);
total= sum(R+G+B);

% Calcula as percentagens
R=R/total;
G=G/total;
B=B/total;

%TO DELETE IF 'R' is an array 
if (isvector(R)==0)
    disp('R n�o � um array');
end
% 
% figure
% stem(R,'r');
% hold on;
% stem(G,'g');
% hold on;
% stem(B,'b');
% hold on;
% legend(' Red channel','Green channel','Blue channel');
% figure();
end

