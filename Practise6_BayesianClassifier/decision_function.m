function x = decision_function(momentos_centrados, covariance)
    x = log(inv((2*pi)^(7/2) * det(covariance)^(0.5))) * exp((-1/2) * (momentos_centrados) * inv(covariance) * (momentos_centrados)');
end