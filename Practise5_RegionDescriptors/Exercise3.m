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

[centroide_A_X, centroide_A_Y] = centroide(momentos_A);
[centroide_B_X, centroide_B_Y] = centroide(momentos_B);
[centroide_C_X, centroide_C_Y] = centroide(momentos_C);

 figure();
 scatter(momentos_A(:, 1), momentos_A(:, 2), [], 'r'), hold on;
 scatter(momentos_B(:, 1), momentos_B(:, 2), [], 'b');
 scatter(momentos_C(:, 1), momentos_C(:, 2), [], 'g');
 scatter(centroide_A_X, centroide_A_Y, [], '*');
 scatter(centroide_B_X, centroide_B_Y, [], '*');
 scatter(centroide_C_X, centroide_C_Y, [], '*');
 hold off;

function [centroid_X, centroid_Y] = centroide(M)
    centroid_X = sum(M(:,1))/15;
    centroid_Y = sum(M(:,2))/15;
end