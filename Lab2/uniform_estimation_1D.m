function [a, b] = uniform_estimation_1D(data)
%the ML estimation of a uniform distribution must include all the sample
%points but have minimum width
    a = min(data);
    b = max(data);
end