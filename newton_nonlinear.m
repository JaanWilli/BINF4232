function x = newton_nonlinear(f,x0,tol,nmax)

    % UNTESTED
    iter = 0;
    err = tol+1;
    J = jacobian(f,x); % x should be symbolic
    
    while err > tol && iter < nmax
        iter = iter + 1;
        
        p = -J \ f(x0);
        x = x0 + p;
        
        err = norm(p);
        x0 = x;
    end
end