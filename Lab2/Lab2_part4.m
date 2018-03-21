clear all;
close all;
clc;

syms ysol x1 x2

%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 4 - Model Estimation 2-D Case
load('lab2_3.mat')

% Initialize as 1 so loop begins
num_ab = 1;
num_ba = 1;

% Set the tries limit and number of tries
limit_tries = 20;
num_tries = 1;

points_list = zeros(limit_tries, 4);
misclassified_list = zeros(limit_tries, 1);
    
while (num_ab > 0) && (num_ba > 0) && (num_tries <= limit_tries)
    random_a_point = a(randi([0 200]),:);
    random_b_point = b(randi([0 200]),:);

    discriminant = find_MED_Discriminant(random_a_point', random_b_point');

    num_ab = 0;
    num_ba = 0;
    total_misclassified = 0;

    for i = 1:200
        % Check if the a point is classified as b 
        a_value = double(subs(discriminant, [x1 x2], [a(i,1) a(i,2)]));
        if (a_value < 0)
            num_ab = num_ab + 1;
        end

        % Check if the b point is classified as a
        b_value = double(subs(discriminant, [x1 x2], [b(i,1) b(i,2)]));
        if (b_value > 0)
            num_ba = num_ba + 1;
        end
    end
    
    misclassified_list(num_tries) = num_ab + num_ba;
    points_list(num_tries, :) = [random_a_point random_b_point];
    
    num_tries = num_tries + 1
end
 
%%
[minimum, min_index] = min(misclassified_list);
discriminant = find_MED_Discriminant(a(min_index, :)', b(min_index, :)');

for i = 200:-1:1
    % Remove the properly classified A points
    a_value = double(subs(discriminant, [x1 x2], [a(i,1) a(i,2)]));
    if (a_value > 0)
        a(i, :) = [];
    end

    % Check if the b point is classified as a
    b_value = double(subs(discriminant, [x1 x2], [b(i,1) b(i,2)]));
    if (b_value > 0)
        b(i, :) = [];
    end
end
