im = imread('blood1.tif');
im_g = imnoise(im, 'gaussian');
im_s = imnoise(im, 'salt & pepper');
figure(1);
% Gaussian
h = fspecial('gaussian',[3,3],0.5);
im1 = imfilter(im_g, h);
subplot(2, 4, 1);
imshow(im_g);
subplot(2, 4, 2);
imshow(im1);
subplot(2, 4, 3);
imhist(im_g);
subplot(2, 4, 4);
imhist(im1);
im2 = imfilter(im_s, h);
subplot(2, 4, 5);
imshow(im_s);
subplot(2, 4, 6);
imshow(im2);
subplot(2, 4, 7);
imhist(im_s);
subplot(2, 4, 8);
imhist(im2);

figure(2);
% Neighborhood averaging filter
h = 1/9 * ones(3);
im1 = imfilter(im_g, h);
subplot(2, 4, 1);
imshow(im_g);
subplot(2, 4, 2);
imshow(im1);
subplot(2, 4, 3);
imhist(im_g);
subplot(2, 4, 4);
imhist(im1);
im2 = imfilter(im_s, h);
subplot(2, 4, 5);
imshow(im_s);
subplot(2, 4, 6);
imshow(im2);
subplot(2, 4, 7);
imhist(im_s);
subplot(2, 4, 8);
imhist(im2);

figure(3);
% Median
im3 = medfilt2(im_g);
subplot(2, 4, 1);
imshow(im_g);
subplot(2, 4, 2);
imshow(im3);
subplot(2, 4, 3);
imhist(im_g);
subplot(2, 4, 4);
imhist(im3);
im3 = medfilt2(im_s);
subplot(2, 4, 5);
imshow(im_s);
subplot(2, 4, 6);
imshow(im3);
subplot(2, 4, 7);
imhist(im_s);
subplot(2, 4, 8);
imhist(im3);


