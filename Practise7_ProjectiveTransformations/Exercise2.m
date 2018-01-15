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
disp(obj_h)
H = homography2d(p_h, obj_h);

tf = maketform('projective', H');
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
        end
    end
end

imshow(projection);
hold off;
