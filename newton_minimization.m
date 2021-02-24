function x = newton_minimization(f,x0,tol,nmax)

    % UNTESTED
    iter = 0;
    err = tol+1;
    
    D = gradient(f); % not sure 
    H = jacobian(D); % if that works
    
    while err > tol && iter < nmax
        iter = iter + 1;
        
        p = -H(x0) \ D(x0);
        x = x0 + p;
        
        err = norm(p);
        x0 = x;
    end
end