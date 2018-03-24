function parzen_plotML(al, bl, cl)
   % Gaussian window
    w_sz = 400;
    mu = [w_sz/2 w_sz/2];
    cov = [400 0; 0 400];
    step = 1;
    res = [step 0 0 450 450];
    [x,y] = meshgrid(1:step:w_sz);
    w = mvnpdf([x(:) y(:)], mu, cov);
    w = reshape(w,length(y),length(x));
    % Parzen function
    [p_a, x_a, y_a] = parzen(al,res, w);
    [p_b, x_b, y_b] = parzen(bl,res, w);
    [p_c, x_c, y_c] = parzen(cl,res, w);
    % Compare probabilities
    n1 = 0; n2 = 0; n3 = 0;
    for x = 1:step:452
        for y = 1:step:452 
            if max([p_a(x,y) p_b(x,y) p_c(x,y)]) == p_a(x,y)
                n1 = n1+1;
                region1(n1,:) = [x_a(x) y_a(y)];
            end
            if max([p_a(x,y) p_b(x,y) p_c(x,y)]) == p_b(x,y)
                n2 = n2+1;
                region2(n2,:) = [x_b(x) y_b(y)];
            end
            if max([p_a(x,y) p_b(x,y) p_c(x,y)]) == p_c(x,y)
                n3 = n3+1;
                region3(n3,:) = [x_c(x) y_c(y)];
            end
        end
    end
    % Plot
    if exist('region1')
        RGB = [139 182 249]/256 ;
        scatter(region1(:,2), region1(:,1), [], RGB);
    end
    if exist('region2')
        RGB = [255 149 145]/256 ;
        scatter(region2(:,2), region2(:,1), [], RGB);
    end
    if exist('region3') 
        RGB = [241 255 239]/256 ;
        scatter(region3(:,2), region3(:,1), [], RGB);
    end
    xlabel('x1');
    ylabel('x2');
end