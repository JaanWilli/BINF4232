function y = forwardeuler(f,y0,a,b,step)

    y(1) = y0;
    t(1) = a;
    n = (b-a)/step; % number of steps
    for i = 1:n
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + step * f(y(i),t(i));
    end
end