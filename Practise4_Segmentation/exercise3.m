im = imread('torre_monica.jpg'); %Convert to grayscale & double
im = im2double(rgb2gray(im));
clus = segmentation_em(im, 2); %Image with segm. result 
im_clust = uint8(255*(clus-1)/(max(max(clus))-1));
figure; subplot(1,3,1); imshow(im); title('Imagen original');
%subplot(1,3,2); imshow(im_km); title('Segmentacion K-Means');
subplot(1,3,3); imshow(im_clust); title('Segmentacion EM');