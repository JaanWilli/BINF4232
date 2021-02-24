function y = backwardeuler_linear(coef,y0,a,b,step)

    % UNTESTED
    y(1) = y0;
    t(1) = a;
    n = (b-a)/step; % number of steps
    
    for i = 1:n
        t(i+1) = t(i) + step;
        y(i+1) = (1 - t(i+1)*coef)\y(i);
    end
end