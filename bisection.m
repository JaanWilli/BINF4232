function x = bisection(f,a,b,tol)

    mid = (a + b)/2;
    err = tol+1;
    
    while err > tol
        if f(a)*f(mid) < 0 % zero is left of mid
            b = mid;
        else % zero is right of mid
            a = mid;          
        end
        mid = (a + b)/2; 
        err = abs(f(mid));
    end
    x = mid;
end
