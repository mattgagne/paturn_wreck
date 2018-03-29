function [confusion_matrix, percent_correct] = get_confusion_matrix(fn, fnt)
    num_points = size(fn, 2);

    distances = zeros(10,1);
    confusion_matrix = zeros(10,10);
    class_means = zeros(10,2); % stores the means
    class_cov = zeros(10, 2, 2); % 10 2x2 matrices storing the covariances

    [class_means, class_cov] = get_means_and_variances(fn);

    for i = 1:num_points
        x_point = fnt(1,i);
        y_point = fnt(2,i);
        actual_class = fnt(3,i); %image numbers

        % Find the distances for each class
        for j = 1:10
            distances(j) = find_MICD_distance(class_means(j,:), class_cov(j,:,:), x_point, y_point);
        end

        [distance, MICD_class] = min(distances);

        confusion_matrix(actual_class, MICD_class) = confusion_matrix(actual_class, MICD_class) + 1;
    end

    percent_correct = trace(confusion_matrix)/160*100;
end