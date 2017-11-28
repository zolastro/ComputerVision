global region; %region que va creciendo. Es una matriz del tama�o la imagen, con todo a cero salo la region, a uno. 
global media; %media (dinamica) de la region que va creciendo
global points_in_region; %numero de puntos en la region que crece
global im1; %imagen 
im1 = imread('rice.tif');
region = zeros(size(im1));
imshow(im1);
[x, y] = ginput();
x = floor(x);
y = floor(y);
media = double(im1(y, x));
points_in_region = 0;

crec_recur(x, y, 30);

imshow(im1),
hold on;
aux = pintar_verde(region, im1, 0);
imshow(aux);
hold off;