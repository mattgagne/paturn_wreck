function plot_ML(z1, z2, z3, S1, S2, S3, xmin, xmax)
    dx = 1;
    n1 = 0; n2 = 0; n3 = 0;
    for x1 = xmin:dx:xmax
        for x2 = xmin:dx:xmax
            x = [x1; x2];
            d1 = ((x-z1)'*inv(S1)*(x-z1)) + log(det(S1));
            d2 = ((x-z2)'*inv(S2)*(x-z2)) + log(det(S2));
            d3 = ((x-z3)'*inv(S3)*(x-z3)) + log(det(S3));
            
            if min([d1 d2 d3]) == d1
                n1 = n1+1;
                region1(n1,:) = x;
            end
            if min([d1 d2 d3]) == d2
                n2 = n2+1;
                region2(n2,:) = x;
            end
            if min([d1 d2 d3]) == d3
                n3 = n3+1;
                region3(n3,:) = x;
            end
        end
    end
    if exist('region1')
        RGB = [139 182 249]/256 ;
        scatter(region1(:,1), region1(:,2), [], RGB);
    end
    if exist('region2')
        RGB = [255 149 145]/256 ;
        scatter(region2(:,1), region2(:,2), [], RGB);
    end
    if exist('region3') 
        RGB = [241 255 239]/256 ;
        scatter(region3(:,1), region3(:,2), [], RGB);
    end
    xlabel('x1');
    ylabel('x2');
end
