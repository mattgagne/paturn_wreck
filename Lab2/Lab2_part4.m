clear all;
close all;
clc;

syms x1 x2 discriminants_list

%% SYDE 372 Pattern Recognition 
%% Lab 2: Model Estimation and Discriminant Functions
%Hillary Ngai - 20609183
%Matt Gagne - 20507759 
%Nick Heersink - 20521906 

%% Question 4 - Model Estimation 2-D Case
load('lab2_3.mat')

% Create copies of the points
a_copy = a;
b_copy = b;

% Initialize as 1 so loop begins
num_ab = 1;
num_ba = 1;

% Set the tries limit and number of tries
limit_tries = 20;
num_tries = 1;

% Initialize lists to store information
points_list = zeros(limit_tries, 4);
misclassified_list = zeros(limit_tries, 2);
discriminants_list = sym('a', [limit_tries, 1]);

j = 1;

while (~isempty(a)) && (~isempty(b))
    num_tries = 1;
    num_ab = 1;
    num_ba = 1;
    
    while (num_ab > 0) && (num_ba > 0)
        random_a_point = a(randi([1 size(a,1)]),:);
        random_b_point = b(randi([1 size(b,1)]),:);

        discriminant = find_MED_Discriminant(random_a_point', random_b_point');

        num_ab = 0;
        num_ba = 0;

        for i = 1:size(a,1)
            % Check if the a point is classified as b 
            a_point = [a(i,1) a(i,2)];
            a_value = double(subs(discriminant, [x1 x2], a_point));
            if (a_value > 0)
                num_ab = num_ab + 1;
            end
        end

        for i = 1:size(b,1)
            % Check if the b point is classified as a
            b_point = [b(i,1) b(i,2)];
            b_value = double(subs(discriminant, [x1 x2], b_point));
            if (b_value < 0)
                num_ba = num_ba + 1;
            end
        end

        % Store the values
        misclassified_list(j, :) = [num_ab num_ba];
        
        points_list(j, :) = [random_a_point random_b_point];
        discriminants_list(j) = discriminant;
    end
    
    j = j + 1;
    discriminant = discriminants_list(j - 1);

    % Check if it has classified all A points correctly
    if (misclassified_list(j - 1, 1) == 0)
        for i = size(b,1):-1:1
            % Remove the properly classified B points
            b_value = double(subs(discriminant, [x1 x2], [b(i,1) b(i,2)]));
            if (b_value > 0)
                b(i, :) = [];
            end
        end
    end
    
    % Check if it has classified all B points correctly
    if (misclassified_list(j - 1, 2) == 0)
        for i = size(a,1):-1:1
            % Remove the properly classified A points
            a_value = double(subs(discriminant, [x1 x2], [a(i,1) a(i,2)]));
            if (a_value < 0)
                a(i, :) = [];
            end
        end
    end
end

%% CREATE BOUNDARY
xmin = 220;
xmax = 500;
ymin = 0;
ymax = 280;

dx = 6;
dy = 6;

n1 = 0;
n2 = 0;

regionA = [];
regionB = [];

for x_iter_1 = xmin:dx:xmax
    for x_iter_2 = ymin:dy:ymax
        x = [x_iter_1 x_iter_2];
        
        class_chosen = 0;
        lowest_misclassified = 0;
        
        for i = 1:j-1
            discriminant = discriminants_list(i);

            value = double(subs(discriminant, [x1 x2], [x_iter_1 x_iter_2]));
            
            % Point is classified as A and nBA = 0
            if (value < 0) && (misclassified_list(i,2) == 0)
                n1 = n1 + 1;
                regionA(n1, :) = x;
                class_chosen = 1;
                break;
                
            % Point is classified as B and nAB = 0
            elseif (value > 0) && (misclassified_list(i,1) == 0)
                n2 = n2 + 1;
                regionB(n2, :) = x;
                class_chosen = 1;
                break;
            end
            
            % Most likely class A
            if (value < 0) && (misclassified_list(i,2) < lowest_misclassified)
                lowest_misclassified = misclassified_list(i,2);
                probable_class = 1;
                
            % Most likely class B
            elseif (value > 0) && (misclassified_list(i,1) < lowest_misclassified)
                lowest_misclassified = misclassified_list(i,1);
                probable_class = 2;
            end
        end
        
        if (class_chosen == 0)
            if (probable_class == 1)
                n1 = n1 + 1;
                regionA(n1, :) = x;
            elseif (probable_class == 2)
                n2 = n2 + 1;
                regionB(n2, :) = x;
            end
        end
    end
end

%%
% Plot everything red (since everything else is class B)
RGB = [255 149 145]/256 ;
xgrid = meshgrid(0:6:550);
ygrid = xgrid';
scatter(xgrid(:),ygrid(:),[], RGB, 'filled'); hold on;
% Plot class A
RGB = [139 182 249]/256 ;
scatter(regionA(:,1), regionA(:,2), [], RGB, 'filled');
hold on;
% Plot class B
RGB = [255 149 145]/256 ;
scatter(regionB(:,1), regionB(:,2), [], RGB, 'filled');

%% PLOT THE POINTS
scat_a = scatter(a_copy(:,1), a_copy(:,2), 'b', 'filled')
hold on
scat_b = scatter(b_copy(:,1), b_copy(:,2), 'r', 'filled')
hold on

xlabel('x1'); ylabel('x2');
xlim([0 550]); ylim([0 450]);
legend([scat_a, scat_b],'Data Set A', 'Data Set B');

disp('Finished')
