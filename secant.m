function x = secant(f,x0,x1,tol)

    err = tol+1;
    
    while err > tol
        x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));
        x0 = x1;
        x1 = x2;
        err = abs(x1-x0);
    end
    x = x2;
end