function [ev,ew] = powermethod(A,x0,tol)

    % power method to compute largest eigenvalue
    
    err = tol+1;
    lam0 = 0;
    y = x0/norm(x0);
    
    while err > tol
        x = A*y;
        y = x/norm(x);
        lam1 = y'*A*y;
        err = abs(lam1-lam0)/abs(lam1);
        lam0 = lam1;
    end

    ev = y;
    ew = lam1;
end