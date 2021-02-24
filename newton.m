function x = newton(f,df,x0,tol)
    
    err=tol+1;
    
    while err > tol
        x = x0 - f(x0)/df(x0);
        err = abs(x-x0);
        x0 = x;
    end
end