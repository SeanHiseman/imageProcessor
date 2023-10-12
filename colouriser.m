function colourImage = colouriser(grayImage, colourMap)
% colourises grayscale images
%
% Works by each pixel in the gray image being scaled from 
% 0 to 1, then looping over each pixel converting the pixel to 
% colour to an index specified in the chosen colour map. 
%
% second argument chooses colourmap
% maps are 'parula', 'turbo', 'hsv' and 'jet'
%
% example use 
% 
% img = cf_load2('test.jpg');
% colourImg = cf_ext_b2(img, 'turbo');

%default colourmap
if nargin < 2
    colourMap = parula(256);
end

%checks if grayscale
if ndims(grayImage) == 3
    error("Image is already in colour")
end

switch colourMap
    case 'parula'
        colourMap = parula(256);
    case 'turbo'
        colourMap = turbo(256);
    case 'hsv'
        colourMap = hsv(256);
    case 'jet'
        colourMap = jet(256);
    otherwise
        error('Incorrect colourmap')
end        
% Create blank image same size as the input image
colourImage = zeros(size(grayImage, 1), size(grayImage, 2), 3);

% Scale grayscale values
scaleImg = double(grayImage) / double(intmax(class(grayImage)));

% Loop over each pixel in input image
for row = 1:size(grayImage, 1)
    for col = 1:size(grayImage, 2)
        % Get scaled value of current pixel
        grayValue = scaleImg(row, col);

        % Convert grayscale value to an index into the colourmap
        index = round(grayValue * 255) + 1;

        % Get colour value from the colourmap
        colourValue = colourMap(index, :);

        % Set colour of current pixel in colour image
        colourImage(row, col, :) = colourValue;
    end
end
end

