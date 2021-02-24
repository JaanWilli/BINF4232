function [ev,ew] = powermethod_shift(A,alpha,x0,tol)

    % preconditioned power method to compute largest eigenvalue

    err = tol+1;
    lam0 = 0;
    n = size(A,1);
    
    y = x0/norm(x0);
    B = A - alpha*eye(n);

    while err > tol
        x = B*y;
        y = x/norm(x);
        nu = y'*B*y;
        lam1 = nu + alpha;
        err = abs(lam1-lam0)/abs(lam1);
        lam0 = lam1;
    end
    
    ev = y;
    ew = lam1;
end

