imD = imread('person_depth.png');
im = imread('person_rgb.png');

scale = 5000;

x0 = 319.5;
y0 = 239.5;
f = 525;
[sy, sx] = size(imD);
X = zeros(sy, sx);
Y = zeros(sy, sx);
Z = zeros(sy, sx);

for i = 1: sy
   for j = 1 : sx
        Z(i, j) = double(imD(i, j))/scale;
        if Z(i, j) > 4.5 
           Z(i, j) = 0; 
        else
            X(i, j) = Z(i, j) * ((j-x0)/f);
            Y(i, j) = Z(i, j) * ((i-y0)/f);
        end
   end
end

plot3DScene(-X, -Y, Z, im, 1);
