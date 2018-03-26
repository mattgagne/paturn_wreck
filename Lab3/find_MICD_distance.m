function [ MICD_distance ] = find_MICD_distance( class_mean, class_var, x_coord, y_coord )
    temp_var(1,:) = class_var(:,:,1);
    temp_var(2,:) = class_var(:,:,2);

    point = [x_coord y_coord]';
    MICD_distance = ((point-class_mean')'*inv(temp_var)*(point-class_mean'));
end