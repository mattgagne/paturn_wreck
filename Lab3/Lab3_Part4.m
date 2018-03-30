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
figure(1);
imagesc(multim);
colormap(gray);
title('Multim');
xlabel('X Pixels');
ylabel('Y Pixels');

figure(2);
imagesc(cimage);
colorbar('westoutside');
title('Classified Multim');
xlabel('X Pixels');
ylabel('Y Pixels');
descr = {'Legend'; '1 = Cloth'; '2 = Cotton'; '3 = Grass'; '4 = Pigskin'; '5 = Wood';
    '6 = Cork'; '7 = Paper'; '8 = Stone'; '9 = Raiffa'; '10 = Face'};
ax1 = axes('Position',[0 0 1 1],'Visible','off');
axes(ax1); % sets ax1 to current axes
txt = text(.068,0.6,descr);
txt.FontWeight = 'bold';
txt.HorizontalAlignment = 'center';

