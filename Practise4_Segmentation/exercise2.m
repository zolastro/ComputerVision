im = imread('torre_monica.jpg');
figure, subplot(2,2,1), imshow(im), title('Imagen Original');
nPixels = size(im,1) * size(im,2);
data = reshape(im, nPixels, 3); %Image as a vector 
pert = kmeans(double(data), 2); %
clus=reshape(pert, size(im, 1), size(im, 2)); %Vector Image back to a matrix 
im_clust=uint8(255*(clus-1)./(max(max(clus))-1));
subplot(2,2,2), imshow(im_clust), title('Imagen original segmentada');

im_gray = rgb2gray(im); 
subplot(2,2,3), imshow(im_gray), title('Imagen Gris');
nPixels = prod(size(im_gray));
data = reshape(im_gray, nPixels, 1); %Image as a vector 
pert = kmeans(double(data), 2); %
clus=reshape(pert, size(im_gray)); %Vector Image back to a matrix 
im_clust=uint8(255*(clus-1)/(max(max(clus))-1));
subplot(2,2,4), imshow(im_clust), title('Imagen gris segmentada');