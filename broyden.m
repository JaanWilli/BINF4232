function x = broyden(f,x0,B0,tol)

    % UNTESTED
    err = tol+1;
    
    while err > tol
        p = -B0 \ f(x0);
        x = x0 + p;
        df = f(x) - f(x0);
        B = B0 + ((df-B0*p)*p')/(p'*p);
        err = norm(x-x0) + norm(f(x));
        
        x0 = x;
        B0 = B;
    end
end