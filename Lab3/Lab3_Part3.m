clear all;
close all;
clc;

%% SYDE 372 Pattern Recognition 
%% Lab 3: Image Classification
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906

load('feat.mat')

% Replace all on f32, f32, or f32 to the desired data set
data_length = size(f32);
num_points = data_length(1,2); 

distances = zeros(10,1);
confusion_matrix = zeros(10,10);
class_means = zeros(10,2); % stores the means
class_cov = zeros(10, 2, 2); % 10 2x2 matrices storing the covariances

xmin = 0;
xmax = 0.14;
ymin = 0;
ymax = 0.17;

dx = 0.01;
dy = 0.01;

temp_data = [];

% Find the mean/covariance for each class
for i = 1:10
    temp_data = [];
    
    % include all points that are a part of that class number
    for j = 1:num_points
        if (f32(3,j) == i)
            temp_data = [temp_data; f32(1,j) f32(2,j)];
        end
    end
    
    [class_means(i,:), class_cov(i,:,:)] = gaussianEstimation2D(temp_data);
end

data_length = size(f32t);
num_points = data_length(1,2); 

for i = 1:num_points
    x_point = f32t(1,i);
    y_point = f32t(2,i);
    actual_class = f32t(3,i);
    
    % Find the distances for each class
    for j = 1:10
        distances(j) = find_MICD_distance(class_means(j,:), class_cov(j,:,:), x_point, y_point);
    end
    
    [distance, MICD_class] = min(distances);
    
    confusion_matrix(actual_class, MICD_class) = confusion_matrix(actual_class, MICD_class) + 1;
end

percent_correct = trace(confusion_matrix)/160*100
        