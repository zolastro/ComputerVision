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

figure();
scatter(momentos_A(:, 1), momentos_A(:, 2), [], 'r'), hold on;
scatter(momentos_B(:, 1), momentos_B(:, 2), [], 'b');
scatter(momentos_C(:, 1), momentos_C(:, 2), [], 'g');

hold off;