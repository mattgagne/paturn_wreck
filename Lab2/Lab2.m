%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 2 - Model Estimation 1-D Case
%% a)ML Parametric Estimation - Gaussian
% Assuming the samples are independent and guassian, the sample mean is the
% true mean
muA_gaus = mean(al, 1);
muA_gaus = mean(muA_gaus, 2);
nA = length(al);

syms mu sigma x
gaussian = @(mu, sigma, x) (exp(-1/2*((x-mu)/sigma)^2)/(sqrt(2*pi)*sigma));
log_gauss = @(mu, sigma, x) ln(gaussian(mu, sigma, x));
diff_log_gauss = [diff(gaussian, mu) diff(gaussian, sigma)];

%unsure how to differentiate a function with a sum in it.


