function [mu, sigma] = gaussianEstimation1D(data)
    %Assuming the samples are gaussian and independent the true mean is just
    %the sample mean and the true covariance is the sample covariance
    N = length(data);
    mu = sum(data)/N;
    var = sum((data - mu).^2) / N;
    sigma = sqrt(var);
end