function obj = fg_detect( blah, blah2)
% Detects Foreground of a given RGB+D image

% Opening dataset
d = 'rgb_image_1_1.png';
dd = dir('depth1_1.mat');
ims=[];
imsd=[];

% Converting image to gray
for i=1:length(d),
    im = rgb2gray(imread(d(i).name));
    imshow(im); colormap(gray);
    load(dd(i).name);
    drawnow;
    
    %Convert to column vector to apply filters
    ims = [ims im(:)];
    imsd=[imsd depth_array(:)];
end

%Apply filter to have stronger border contrast
medim = median(double(ims),2);
meddep = median(double(imsd),2);


end