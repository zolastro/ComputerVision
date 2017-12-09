numero_imagenes = 15;
categories = 'ABC';
momentos = zeros(3, 15, 7);
centroides = zeros(3, 7);
momentos_centrados = zeros(3, 15, 7);
for c = 1: 3
    for i = 1: 15
        im = imread(strcat(strcat('botella_', categories(c), '_', int2str(i)), '.bmp'));
        momentos(c,i,:) = momentos_Hu(im);
    end
    for i = 1: 7
       centroides(c, i) = sum(momentos(c, :, i))/numero_imagenes;
    end    
   momentos_centrados(c, :) =  momentos(c, :) - centroides(c);
end

covariance_matrix = zeros(3, 7, 7);

for c = 1 : 3
    covariance_matrix(c, :) = (momentos_centrados(c)*momentos_centrados(c)') ./ numero_imagenes;
    error_ellipse(covariance_matrix(c, 1:2, 1:2), centroides(c, 1:2));
end

