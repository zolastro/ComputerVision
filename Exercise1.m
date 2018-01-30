load cameraParams.mat
cx = cameraParams.ImageSize(1)/2;
cy = cameraParams.ImageSize(2)/2;
f = mean(cameraParams.FocalLength);
b = 0.10;
[x1 x2] = getcorrkeypoints('photo_left.jpeg', 'photo_right.jpeg');
[F, inliers] = ransacfitfundmatrix(x1, x2,1e-5);