path = 'long_jump_2.png';
im = imread(path);
im = rgb2gray(im);
im = im2double(im);
imshow(im);
p = ginput(4);
p_h = [p ones(4, 1)]';

scale = 5;

width = 30 * scale;
height = 122 * scale;

obj_h = [1, 1, 1; width, 1, 1; width, height, 1; 1, height, 1]';
H = homography2d(p_h, obj_h);

tf = maketform('projective', H');
plane = imtransform(im, tf, 'Xdata', [1 width], 'yData', [1 height]);

imshow(plane);

[p_x p_y] = ginput(1);
d = p_x * 20 / size(plane, 2);
d = 20 - d;

disp(round(d));