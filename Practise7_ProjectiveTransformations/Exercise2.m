<<<<<<< HEAD
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



=======
path = 'bernabeu.jpg';
im = imread(path);
im = rgb2gray(im);
imshow(im), hold on;
p = ginput(4);
p_h = [p ones(4, 1)]';
disp(p_h);

scale = 5;

width = 69 * scale;
height = 105 * scale;

obj_h = [1, 1, 1; width, 1, 1; width, height, 1; 1, height, 1]';
>>>>>>> d6f6ff8556c7b22deb6ad2277376168cf5fc995e
disp(obj_h)
H = homography2d(p_h, obj_h);

tf = maketform('projective', H');
<<<<<<< HEAD
projection = imtransform(projection, tf, 'Xdata', [1 width], 'yData', [1 height]);
projection = imresize(projection, [768 1024]);

for (i = 1: 768)
    for (j = 1: 1024)
        if(projection(i, j) == 0) 
           projection(i, j) = im(i, j); 
=======
plane = imtransform(im, tf, 'XData', [1 width], 'YData', [1 height]);
projection = imread('chiquito2.jpg');
projection = rgb2gray(projection);
projection = imresize(projection,[size(plane)]);
inv_tf = fliptform(tf);
projection = imtransform(projection, inv_tf,  'XData', [1 size(im, 2)], 'YData', [1 size(im, 1)]);
mask = uint8(projection == 0);
for i = 1:size(projection, 1)
    for j = 1:size(projection, 2)
        
        if mask(i,j) == 1
            projection(i,j) = im(i,j);
>>>>>>> d6f6ff8556c7b22deb6ad2277376168cf5fc995e
        end
    end
end

imshow(projection);
<<<<<<< HEAD
hold off;
=======
hold off;
>>>>>>> d6f6ff8556c7b22deb6ad2277376168cf5fc995e
