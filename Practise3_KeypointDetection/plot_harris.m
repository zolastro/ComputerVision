function plot_harris(im_name_1, im_name_2)
    % We load the images
    im1 = imread(im_name_1);
    im2 = imread(im_name_2);
    
    % Store the relevant keypoints
    [~, r1, c1] = harris(im1, 2, 1000, 10, 0); 
    [~, r2, c2] = harris(im2, 2, 1000, 10, 0); 
    
    % Set a window size
    win_size = 10;
    
    figure(1) 
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
                
                %Plot results
                subplot(2, 2, 1);
                plot_image(im1, c1, r1, 'ro'),
                hold on
                rectangle('Position',[c1(i)-win_size,r1(i)-win_size,win_size*2,win_size*2], 'EdgeColor','g');
                hold off

                subplot(2,2,2);
                plot_image(im2, c2, r2, 'mo');
                rectangle('Position',[c2(max_index)-win_size,r2(max_index)-win_size,win_size*2,win_size*2], 'EdgeColor','g');                
                
                subplot(2, 2, 3);
                imshow(sect);
                
                
                subplot(2,2,4);
                scatter(c2, corr_vertex, 7, 'filled'),
                hold on;
                % Highlight the best keypoint
                plot(c2(max_index), max_value, '*g', 'MarkerSize', 10);
                hold off;
                pause;
                

    end
    hold off 
end

% This function plots the image and the keypoints
function plot_image(im, r, c, color)
    imshow(im),
    hold on
    plot(r, c, color);
    hold off
end
