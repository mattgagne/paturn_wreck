%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 2 - Model Estimation 1-D Case
%% a)ML Parametric Estimation - Gaussian
function [mu, sigma] = gaussianEstimation1D(data)
    %Assuming the samples are gaussian and independent the true mean is just
    %the sample mean and the true covariance is the sample covariance
    N = length(data);
    mu = sum(data)/N;
    var = sum((data - mu).^2) / N;
    sigma = sqrt(var);
end



