function parzen_plotML(al, bl, cl)
   % Making a Gaussian window with variance of 400
    k = 400;
    mu = [k/2 k/2];
    cov = [400 0; 0 400];
    step = 1;

    % Defining the area of interest
    res = [step 0 0 450 450];

    [X1,X2] = meshgrid(1:step:k);
    win = mvnpdf([X1(:) X2(:)], mu, cov);
    win = reshape(win,length(X2),length(X1));

    [p_a, x_a, y_a] = parzen(al,res, win);
    [p_b, x_b, y_b] = parzen(bl,res, win);
    [p_c, x_c, y_c] = parzen(cl,res, win);

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