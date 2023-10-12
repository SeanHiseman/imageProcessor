function imageDisplay(s, domain)
% displays an image in spatial or frequency domains
% example use
% img = cf_load2('test.jpg');
% cf_display2(img, 'f');
 
if nargin < 2
    domain = 's';
end

if domain == 's' 
    imshow(s);
elseif domain == 'f'
    %calculates fourier transform
    img = fft2(s);
    img = fftshift(abs(img));
    %log scales transform
    img = log10(img+1);
    %magnitude normalised
    img = mat2gray(img);
    imshow(img);
else
    error("Incorrect domain");
end     
end

