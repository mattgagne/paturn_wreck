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

pdf = normpdf(x, muA, sdA);
pdfEst = normpdf(x, muEst, sigmaEst);

figure(1);
hold on;
scatter(a, y);
plot(x, pdf);
plot(x, pdfEst);
title('ML Estimation of Gaussian Distribution');
legend('Samples', 'True Gaussian PDF ', 'Estimated Gaussian PDF');
xlabel('x');
ylabel('p(x)');
grid on;
hold off;



