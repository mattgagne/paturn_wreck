function [lambda] = exponentialEstimation1D(data)
    N = length(data);
    lambda = N/sum(data);
end