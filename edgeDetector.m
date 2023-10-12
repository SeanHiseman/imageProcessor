function outputImage = edgeDetector(inputImage, threshold, patchSize)
% edge detector
%
% This function outputs an image of the edges in an input image
% It works by applying the sobel operator, which calculates the
% gradient of image intensity in x and y directions at each pixel
%
% Second input argument selects the sensitivity of the detector
% from 0-100, higher means less edges
%
% third input argument selects size of pixel patches to remove
% allowing custom noise reduction
%
% example use
%
% img = cf_load2('test4.jpg');
% result = cf_ext_a2(img, 40, 100);

%set defaults if not specified 
if nargin < 3
    patchSize = 50;
end
if nargin < 2
    threshold = 50;
end

%checks if image is grayscale
if ndims(inputImage) == 3
    grayScale = rgb2gray(inputImage);
end

%kernels used for edge detection
X = [-1 0 1; -2 0 2; -1 0 1];
Y = [-1 -2 -1; 0 0 0; 1 2 1];

%apply Sobel operator
opX = conv2(grayScale, X, 'same');
opY = conv2(grayScale, Y, 'same');

%gradient magnitude
gradMag = sqrt(opX.^2 + opY.^2);

%obtain edges
edges = gradMag > threshold;

%cut down pixel patches smaller than specified size
outputImage = bwareaopen(edges, patchSize);
end

