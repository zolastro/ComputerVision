numero_imagenes = 15;
categories = 'ABC';
symbols = '*xc';
colors = 'brg';
momentos = zeros(15, 7);
centroides = zeros(7, 1);
matriz_covarianza = zeros(7, 7);
momentos_centrados = zeros(15, 7);

%Used to classify bottles
global centroides_clases;
global matrices_covarianza_clases;
centroides_clases = zeros(7, 3);
matrices_covarianza_clases = zeros(7, 7, 3);

for c = 1: 3
    for i = 1: 15
        im = imread(strcat(strcat('botella_', categories(c), '_', int2str(i)), '.bmp'));
        momentos(i,:) = momentos_Hu(im);
    end

    for i = 1: 7
       centroides(i) = sum(momentos(:, i))./numero_imagenes;
       momentos_centrados(:, i) = momentos(:, i) - centroides(i);
    end
   centroides_clases(:, c) = centroides(:);
   matriz_covarianza = (momentos_centrados' * momentos_centrados) ./ numero_imagenes;
   matrices_covarianza_clases(:, :, c) = matriz_covarianza(:, :);
   error_ellipse(matriz_covarianza(1:2, 1:2) .* 10, centroides(1:2) ), hold on;
   scatter(momentos(:, 1), momentos(:, 2), symbols(c), colors(c));
   scatter(centroides(1), centroides(2), 's', 'r');
end

disp("Classifying some bottles...");

for c = 1:3
    for i = 11: 15
        name = strcat(strcat('botella_', categories(c), '_', int2str(i)), '.bmp');
        im = imread(name);
        mhu = momentos_Hu(im);
        x = belonging_class(im);
        disp(strcat("Bottle ", name,  " belongs to: ", categories(x)));
        point = plot(mhu(1), mhu(2), 'cd');
        tag = text(mhu(1) + 0.005, mhu(2) + 0.005, ['Classified as: ' categories(x)]);
        pause();
        delete(point);
        delete(tag);
    end
end



