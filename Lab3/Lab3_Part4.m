close all; clear all; clc;
load feat.mat
[class_means class_cov] = get_means_and_variances(f8);

for i = 1:size(multf8,1)
    for j = 1:size(multf8,2)
        x1 = multf8(i,j,1);
        x2 = multf8(i,j,2);

        % Find the distances for each class
        for class = 1:10
            distances(class) = find_MICD_distance(class_means(class,:), class_cov(class,:,:), x1, x2);
        end

        [distance, MICD_class] = min(distances);
        cimage(i,j) = MICD_class;
    end
end
%% Plot
figure();
imagesc(multim);
colormap(gray);
title('multim');
figure();
imagesc(cimage);
colorbar