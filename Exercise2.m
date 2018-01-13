path = input('Introduce the image to project image: ');
projection = im2double(rgb2gray(imread(path)));
im = imread('bernabeu.jpg');
im = rgb2gray(im);
im = im2double(im);
imshow(im);
p = ginput(4);
obj_h = [p ones(4, 1)]';

width = size(im, 1);
height = size(im, 2);

p_h = [1, 1, 1; width, 1, 1; width, height, 1; 1, height, 1]';



disp(obj_h)
H = homography2d(p_h, obj_h);

tf = maketform('projective', H');
projection = imtransform(projection, tf, 'Xdata', [1 width], 'yData', [1 height]);
projection = imresize(projection, [768 1024]);

for (i = 1: 768)
    for (j = 1: 1024)
        if(projection(i, j) == 0) 
           projection(i, j) = im(i, j); 
        end
    end
end

imshow(projection);
hold off;