load cameraParams.mat
clc;
% My photos
%imL = imread('photo_left.jpeg');
%imR = imread('photo_right.jpeg');
% Pepsi
imL = imread('pepsi_left.tif');
imR = imread('pepsi_right.tif');
%Comment if already in path, otherwise it might take a while...
%[x1 x2] = getcorrkeypoints(imL, imR, 0.95, 20);
%[F, inliers] = ransacfitfundmatrix(x1, x2,1e-5);
X = [];
Y = [];
Z = [];
% My camera's params
% cx = cameraParams.ImageSize(1)/2; cy = cameraParams.ImageSize(2)/2;
% f = mean(cameraParams.FocalLength); b = 0.10;
% Pepsi params
cx = 255.64; cy = 201.12;
f = 351.32; b = 0.119;
for i = 1: size(x1, 2)
   d = x1(1, i) - x2(1, i);
   x = b * (x1(1, i) - cx)/d;
   y = b * (x1(2, i) - cy)/d;
   z = f * b / d;
   X = [X x];
   Y = [Y y];
   Z = [Z z];
end
figure(1)
scatter3(X, -Y, Z), hold on;
plot3(X, -Y, Z, 'g');

hold off;
figure(2)
subplot(1, 2, 1), imshow(imL);
subplot(1, 2, 2), imshow(imR);
but = 1;

while(but == 1) 
    [x y but] = ginput(1);
    ln = F*[x;y;1];
    ln = ln./ln(3);    
    x0 = [0 size(imR,2)];
    y0 = [-ln(3)/ln(2) -ln(1)/ln(2)*x0(2)-ln(3)/ln(2)];
    subplot(1, 2, 2), hold on;
    plot(x0, y0);
    pause;
end
hold off;

