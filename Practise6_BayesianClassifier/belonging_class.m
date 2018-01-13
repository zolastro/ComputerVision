function x = belonging_class(image)
global matrices_covarianza_clases;
global centroides_clases;

 hmi = momentos_Hu(image);
    decision = zeros(1,3);
    for i = 1:3
        decision(i) = decision_function(hmi - centroides_clases(:, i)', matrices_covarianza_clases(:,:,i)); % scale factor
    end
    [~, x] = max(decision);
end