numero_imagenes = 15;
categories = 'ABC';
symbols = '*xc';
colors = 'brg';
momentos = zeros(15, 7);
centroides = zeros(7, 1);
covariance_matrix = zeros(7, 7);
momentos_centrados = zeros(15, 7);
for c = 1: 3
    for i = 1: 15
        im = imread(strcat(strcat('botella_', categories(c), '_', int2str(i)), '.bmp'));
        momentos(i,:) = momentos_Hu(im);
    end

    for i = 1: 7
       centroides(i) = sum(momentos(:, i))./numero_imagenes;
       momentos_centrados(:, i) = momentos(:, i) - centroides(i);
    end
   covariance_matrix = (momentos_centrados' * momentos_centrados) ./ numero_imagenes;
   error_ellipse(covariance_matrix(1:2, 1:2) .* 10, centroides(1:2) ), hold on;
   scatter(momentos(:, 1), momentos(:, 2), symbols(c), colors(c));
   scatter(centroides(1), centroides(2), 's', 'r');
end
hold off;

