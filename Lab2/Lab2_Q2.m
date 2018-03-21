%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 2 - Model Estimation 1-D Case
%% a)ML Parametric Estimation - Gaussian
close all; clear all; clc;
load('lab2_1.mat');
mu_A = 5;
sd_A = 1;

max_val_a = max(a(1,:))+1;
min_val_a = min(a(1,:))-1;
max_val_b = max(b(1,:))+1;
min_val_b = min(b(1,:))-1;

% Gaussian Estimation - Data Set A
x = 0:0.01:max_val_a;
y = zeros(size(a));
[muEst, sigmaEst] = gaussianEstimation1D(a);

pdf_gauss = normpdf(x, mu_A, sd_A);
pdf_est_gauss = normpdf(x, muEst, sigmaEst);

figure(1); hold on; grid on;
scatter(a, y);
plot(x, pdf_gauss);
plot(x, pdf_est_gauss);
title('Gaussian Estimation of Gaussian Data Set A');
legend('Samples', 'True Gaussian PDF ', 'Estimated Gaussian PDF');
xlabel('x'); ylabel('p(x)');

% Gaussian Estimation - Data Set B
x = 0:0.01:max_val_b;
y = zeros(size(b));
[muEst, sigmaEst] = gaussianEstimation1D(b);

pdf_exp = exp(-x);
pdf_est_gauss = normpdf(x, muEst, sigmaEst);

figure(2);
hold on;
scatter(b, y);
plot(x, pdf_exp);
plot(x, pdf_est_gauss);
title('Gaussian Estimation of Exponential Data Set B');
legend('Samples', 'True Exponential PDF ', 'Estimated Gaussian PDF');
xlabel('x');
ylabel('p(x)');
grid on;

% Exponential Estimation - Data Set A
x = 0:0.01:max_val_a;
y = zeros(size(a));
lam = exponentialEstimation1D(a);

pdf_gauss = normpdf(x, mu_A, sd_A);
pdf_est_exp = lam*exp(-lam*x);

figure(3); hold on; grid on;
scatter(a, y);
plot(x, pdf_gauss);
plot(x, pdf_est_exp);
title('Exponential Estimation of Gaussian Data Set A');
legend('Samples', 'True Gaussian PDF ', 'Estimated Exponential PDF');
xlabel('x'); ylabel('p(x)');

% Exponential Estimation - Data Set B
x = 0:0.01:max_val_b;
y = zeros(size(b));
lam = exponentialEstimation1D(b);

pdf_exp = exp(-x);
pdf_est_exp = lam*exp(-lam*x);

figure(4); hold on; grid on;
scatter(b, y);
plot(x, pdf_exp);
plot(x, pdf_est_exp);
title('Exponential Estimation of Exponential Data Set B');
legend('Samples', 'True Exponential PDF ', 'Estimated Exponential PDF');
xlabel('x'); ylabel('p(x)');

% Parzen Method with Gaussian Windows using sd = 0.1 and sd = 0.4
% Non-Parametric Estimation - Data Set A
x = min_val_a:0.01:max_val_a;
y = zeros(size(a));

pdf_gauss = normpdf(x, mu_A, sd_A);
p_hat_1 = parzen_estimation_1D(a, x, 0.1);
p_hat_2 = parzen_estimation_1D(a, x, 0.4);

figure(5);
hold on;
scatter(a, y);
plot(x, pdf_gauss);
plot(x, p_hat_1);
plot(x, p_hat_2);
title('Parzen Estimation of Exponential Data Set A');
legend('Samples', 'True Gaussian PDF ', 'Estimated Parzen PDF Using SD = 0.1', 'Estimated Parzen PDF Using SD = 0.4');
xlabel('x');
ylabel('p(x)');
grid on;

% Non-Parametric Estimation - Data Set B
x = min_val_b:0.01:max_val_b;
y = zeros(size(b));

pdf_exp = exp(-x);
p_hat_1 = parzen_estimation_1D(b, x, 0.1);
p_hat_2 = parzen_estimation_1D(b, x, 0.4);

figure(6);
hold on;
scatter(b, y);
plot(x, pdf_exp);
plot(x, p_hat_1);
plot(x, p_hat_2);
title('Parzen Estimation of Exponential Data Set B');
legend('Samples', 'True Exponential PDF ', 'Estimated Parzen PDF Using SD = 0.1', 'Estimated Parzen PDF Using SD = 0.4');
xlabel('x');
ylabel('p(x)');
grid on;