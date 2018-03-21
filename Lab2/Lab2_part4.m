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
num_bad_a_points = 1;
num_bad_b_points = 1;
    
while (num_bad_a_points > 0) && (num_bad_b_points > 0)
    random_a_point = a(randi([0 200]),:);
    random_b_point = b(randi([0 200]),:);

    discriminant = find_MED_Discriminant(random_a_point', random_b_point');

    num_bad_a_points = 0;
    num_bad_b_points = 0;

    for i = 1:200
        % Check if the a point is classified as b 
        a_value = double(subs(discriminant, [x1 x2], [a(i,1) a(i,2)]));
        if (a_value < 0)
            num_bad_a_points = num_bad_a_points + 1;
        end

        % Check if the b point is classified as a
        b_value = double(subs(discriminant, [x1 x2], [b(i,1) b(i,2)]));
        if (b_value > 0)
            num_bad_b_points = num_bad_b_points + 1;
        end
    end
    num_bad_a_points
    num_bad_b_points
 end
