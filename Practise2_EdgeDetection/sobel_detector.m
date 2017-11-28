function sobel_detector(im_name, threshold)
    im = imread(im_name);
    im = double(im)/255.0;
    mask_horizontal = fspecial('sobel');
    mask_vertical = mask_horizontal';
    im_edges_horizontal = imadjust(abs(conv2(im, mask_horizontal, 'same')) /4);
    im_edges_vertical = imadjust(abs(conv2(im, mask_vertical, 'same')) /4);
    figure(1);
    %Original
    subplot(2, 2, 1);
    imshow(im);
    %Horizontal
    subplot(2, 2, 2);
    imshow(im_edges_horizontal);
    %Vertical
    subplot(2, 2, 3);
    imshow(im_edges_vertical);
    %Create green edges
    im_edges = im_edges_horizontal + im_edges_vertical;
    im_edges = (im_edges) > threshold;
    %Overlapping images
    im_green = im + im_edges;
    %Kepping the original colour where there aren't edges.
    im_rb = im .* not (im_edges);
    im_final = cat(3, im_rb, im_green, im_rb);
    subplot(2, 2, 4);
    imshow(im_final);
    