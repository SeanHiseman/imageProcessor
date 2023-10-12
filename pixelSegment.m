function m = pixelSegment(s)
% REQUIRES IMAGE PROCESSING TOOLBOX
% segments grayscale image into foreground and background pixels
% example use
% img = cf_load2('test.jpg');
% result = cf_segment(img);

%checks if image is grayscale
if ndims(s) == 3
    s = rgb2gray(s);
end

%doubles precision
dp = im2double(s);

%calculates foreground/background threshold
Threshold = graythresh(dp);

%produces binary mask
mask = imbinarize(dp, Threshold);

%inverts mask so that foreground pixels are 1
mask = ~mask;

%removes patches smaller than 100 pixels
mask = bwareaopen(mask, 100); 

%convert back to grayscale image
m = uint8(mask*255);
end
