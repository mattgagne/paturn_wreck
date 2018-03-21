%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 3 - 2-D Case
%% 1) ML 
close all; clear all; clc;
load('lab2_2.mat');

[mu_A s_A] = gaussianEstimation2D(al);
[mu_B s_B] = gaussianEstimation2D(bl);
[mu_C s_C] = gaussianEstimation2D(cl);
figure(); hold on;
plotML(mu_A', mu_B', mu_C', s_A, s_B, s_C, 0, 450);
scat_a = scatter(al(:,1), al(:,2), 10, 'filled', 'b');
scat_b = scatter(bl(:,1), bl(:,2), 10, 'filled', 'r');
scat_c = scatter(cl(:,1), cl(:,2), 10, 'filled', 'g');
title('Parametric Estimation 2D');
legend([scat_a, scat_b, scat_c],'Data Set A', 'Data Set B', 'Data Set C');

figure(); hold on;
parzen_plotML(al, bl, cl);
scat_a = scatter(al(:,1), al(:,2), 10, 'filled', 'b');
scat_b = scatter(bl(:,1), bl(:,2), 10, 'filled', 'r');
scat_c = scatter(cl(:,1), cl(:,2), 10, 'filled', 'g');
title('Non-Parametric Estimation 2D');
legend([scat_a, scat_b, scat_c],'Data Set A', 'Data Set B', 'Data Set C');
xlim([0 450]); ylim([0 450]);





