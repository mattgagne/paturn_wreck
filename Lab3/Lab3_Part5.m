close all; clear all; clc;
load feat.mat
K = 10;

xmin = [min(f32(1,:)) min(f32(2,:))];
xmax = [max(f32(1,:)) max(f32(2,:))];

%for refreence only
[true_means true_cov] = get_means_and_variances(f32);
iter_lim = 100;
num_points = size(f32,2);
proto = zeros(K,2,iter_lim);
proto(:,1,1) = (xmax(1) - xmin(1)).*rand(10,1) + xmin(1);
proto(:,2,1) = (xmax(2) - xmax(2)).*rand(10,1) + xmin(2);
fclass = f32(1:2,:);
sum = zeros(K,3);
avg = zeros(K,2);
%%
n = 0; % number of iterations
proto_change = Inf;
while proto_change > 0.0001
    
    n = n + 1;
    if (n == iter_lim)
        break;
    end
   
    for i = 1:num_points 
        for k = 1:K
            x1 = proto(k,1,n);
            x2 = proto(k,2,n);
            distances(k) = norm([x1 x2] - [f32(1,i) f32(2,i)]);
        end
        [distance, class] = min(distances);
        fclass(3,i) = class;
        sum(class,1:2) = sum(class,1:2) + fclass(1:2,i)';
        % third element is how many have been summed
        sum(class,3) = sum(class,3) + 1;
    end

    for k = 1:K
        %handle edge cass if a class has zero points
        if (sum(k,1) == 0)
            avg(k,1) = (xmax(1) - xmin(1)).*rand(1,1) + xmin(1);
        else
            avg(k,1) = sum(k,1)/sum(k,3);
        end
        if (sum(k,2) == 0)
            avg(k,2) = (xmax(2) - xmin(2)).*rand(1,1) + xmin(2);
        else
            avg(k,2) = sum(k,2)/sum(k,3);
        end
    end
    proto(:,:,n+1) = avg;
    proto_change = max(abs(norm(proto(:,:,n)) - norm(proto(:,:,n+1))));
    error = true_means - proto(:,:,n);
end


%% Plot
%figure(1);
%imagesc(f32(1:2,:));

    for i = 1:n
        figure(1);clf; hold on;
        xlim([xmin(1) xmax(1)]); ylim([xmin(2) xmax(2)]);
        scatter(true_means(:,1), true_means(:,2), 100, 'filled', 'r'); hold on;
        scatter(proto(:,1,i), proto(:,2,i), 100, 'filled', 'b'); hold on;
        pause(0.1);
    end
    