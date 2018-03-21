%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 2 - Model Estimation 1-D Case
%% a)ML Parametric Estimation - Gaussian
%% Gaussian
% Set A
muA = 5;
sdA = 1;

maxVal = max(a(1,:))+1;
x = 0:0.01:maxVal;
y = zeros(size(a));
[muEst, sigmaEst] = gaussianEstimation1D(a);

pdf_gauss = normpdf(x, muA, sdA);
pdf_est_gauss = normpdf(x, muEst, sigmaEst);

figure(1);
hold on;
scatter(a, y);
plot(x, pdf_gauss);
plot(x, pdf_est_gauss);
title('ML Estimation of Assumed Gaussian Distribution');
legend('Samples', 'True Gaussian PDF ', 'Estimated Gaussian PDF');
xlabel('x');
ylabel('p(x)');
grid on;
hold off;

lam = exponentialEstimation1D(b);

pdf_exp = exp(-x);
pdf_est_exp = lam*exp(-lam*x);

figure(2);
hold on;
scatter(b, y);
plot(x, pdf_exp);
plot(x, pdf_est_exp);
title('ML Estimation Assuming Gaussian Distribution');
legend('Samples', 'True Exponential PDF ', 'Estimated Exponential PDF');
xlabel('x');
ylabel('p(x)');
grid on;
hold off;


