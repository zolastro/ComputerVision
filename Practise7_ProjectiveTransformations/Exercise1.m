path = 'bernabeu.jpg';
im = imread(path);
im = rgb2gray(im);
im = im2double(im);
imshow(im);
p = ginput(4);
p_h = [p ones(4, 1)]';
disp(p_h);

scale = 5;

width = 69 * scale;
height = 105 * scale;

obj_h = [1, 1, 1; width, 1, 1; width, height, 1; 1, height, 1]';
disp(obj_h)
H = homography2d(p_h, obj_h);

tf = maketform('projective', H');
newIm = imtransform(im, tf, 'Xdata', [1 width], 'yData', [1 height]);
figure(2)
imshow(newIm);