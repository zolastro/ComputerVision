
function [x1, x2, xl, yl] = getcorrkeypoints(im_name_1, im_name_2)
    % We load the images
    im1 = imread(im_name_1);
    im2 = imread(im_name_2);
    im1 = rgb2gray(im1);
    im2 = rgb2gray(im2);
    % Store the relevant keypoints
    [~, r1, c1] = harris(im1, 2, 1000, 10, 0); 
    [~, r2, c2] = harris(im2, 2, 1000, 10, 0); 
    x1 = [];
    x2 = [];
   
    % Set a window size
    win_size = 15;
    
    for i = 1:size(r1, 1)
                % Crop section
                sect = imcrop(im1, [(c1(i)-win_size) (r1(i)-win_size) win_size*2 win_size*2]);
                %NCC between the cropped section and the second image
                corr = normxcorr2(sect,im2);
                %Account for the extra padding added by normxcorr2
                yoffSet = win_size;
                xoffSet = win_size;
                %Find the vertex with the highest value in corr
                corr_vertex = zeros(1, numel(r2)); 
                for j = 1 : numel(r2)
                    corr_vertex(j) = corr(r2(j)+xoffSet, c2(j) + yoffSet);
                end
                [max_value, max_index] = max(corr_vertex);
                if(max_value > 0.85)
                    p1 = [c1(i); r1(i)];
                    p2 = [c2(max_index); r2(max_index)];
                    x1 = [x1, p1];
                    x2 = [x2, p2];
                end                
    end
end
