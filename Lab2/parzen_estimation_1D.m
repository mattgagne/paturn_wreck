function [p_hat] = parzen_estimation_1D(data, x, h)
    N = length(data);
    p_hat = zeros(size(x));

    %loop through each x-value
    for i=1:size(x,2)
        sum = 0;
        %add up the probability at x for each data point using its
        %corresponding PDF at x
        for j=1:size(data,2) 
            sum = sum + normpdf(x(i), data(j), h);
        end
        p_hat(i) = 1/N * sum;
    end
end