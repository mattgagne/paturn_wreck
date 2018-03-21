%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 3 - 2-D Case
%% 1) ML 
[mu_A sigma_A] = gaussianEstimation2D(al);
[mu_B sigma_B] = gaussianEstimation2D(al);
[mu_C sigma_C] = gaussianEstimation2D(al);

load('lab2_2.mat');
figure(); hold on;
scatter(al(:,1), al(:,2), 10, 'filled', 'r');
scatter(bl(:,1), bl(:,2), 10, 'filled', 'b');
scatter(cl(:,1), cl(:,2), 10, 'filled', 'g');