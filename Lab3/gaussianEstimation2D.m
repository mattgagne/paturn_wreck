function [ mu, sigma ] = gaussianEstimation2D(data)
    mu = sum(data) / length(data);
    sigma = cov(data);
end