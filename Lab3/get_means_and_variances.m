function [class_means, class_cov] = get_means_and_variances(fn, num_points)
    temp_data = [];

    % Find the mean/covariance for each class
    for i = 1:10
        temp_data = [];

        % include all points that are a part of that class number
        for j = 1:num_points
            if (fn(3,j) == i)
                temp_data = [temp_data; fn(1,j) fn(2,j)];
            end
        end

        [class_means(i,:), class_cov(i,:,:)] = gaussianEstimation2D(temp_data);
    end
end