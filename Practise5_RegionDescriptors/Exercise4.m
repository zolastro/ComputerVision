function Exercise4 (I)
    %Obtener momentos
    momentos_A = zeros(15, 7);
    momentos_B = zeros(15, 7);
    momentos_C = zeros(15, 7);
    for i = 1: 15
        momentos_A(i,:) = momentos_Hu(imread(strcat(strcat('botella_A_', int2str(i)), '.bmp')));
    end
    for i = 1: 15
        momentos_B(i,:) = momentos_Hu(imread(strcat(strcat('botella_B_', int2str(i)), '.bmp')));
    end
    for i = 1: 15
        momentos_C(i,:) = momentos_Hu(imread(strcat(strcat('botella_C_', int2str(i)), '.bmp')));
    end
    
    centroide_A = centroide(momentos_A);
    centroide_B = centroide(momentos_B);
    centroide_C = centroide(momentos_C);

    %Clasificar botella
    momento_imagen = momentos_Hu(I);
    
    distancia = zeros(3, 1);
    distancia(1) = pdist([momento_imagen(1:2); centroide_A], 'euclidean');
    distancia(2) = pdist([momento_imagen(1:2); centroide_B], 'euclidean');
    distancia(3) = pdist([momento_imagen(1:2); centroide_C], 'euclidean');
    
    [~, type] = min(distancia);
    
    switch(type)
        case 1
            disp('A');
        case 2
            disp('B');
        case 3
            disp('C');
    end
end

function centroid = centroide(M)
    centroid_X = sum(M(:,1))/15;
    centroid_Y = sum(M(:,2))/15;
    centroid = [centroid_X centroid_Y];
end