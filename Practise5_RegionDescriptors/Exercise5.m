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
region = im2double(region);

[m00,m10,m01,m11,m20,m02,m21,m12,m30,m03] = momentos(region);
[mu00,mu10,mu01,mu11,mu20,mu02,mu21,mu12,mu30,mu03] = momentos_centrales(region);

x_ = m10/m00; 
y_ = m01/m00;

dispersion = [mu20 mu11; mu11 mu02]./mu00;
[V,D] = eig(dispersion);
imshow(im1), hold on;
aux = pintar_verde(region, im1, 0);
imshow(aux);
plot(x_, y_, 'r*');
line([x_, x_ + V(2)*D(4)], [y_, y_ + V(4) * D(4)], 'LineWidth', 1, 'Color', 'm');
line([x_, x_ + V(1)*D(1)], [y_, y_ + V(3) * D(1)], 'LineWidth', 1, 'Color', 'm');
hold off;

