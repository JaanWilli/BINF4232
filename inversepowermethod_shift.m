function [ev,ew] = inversepowermethod_shift(A,alpha,x0,tol)

    % preconditioned inverse power method to compute eigenvalue closest to
    % alpha
    
    err = tol+1;
    lam0 = 0;
    n = size(A,1);
    
    y = x0/norm(x0);
    B = A - alpha*eye(n);

    while err > tol
        x = inv(B)*y;
        y = x/norm(x);
        nu = y'*inv(B)*y;
        lam1 = 1/nu + alpha;
        err = abs(lam1-lam0)/abs(lam1);
        lam0 = lam1;
    end
    
    ev = y;
    ew = lam1;
end

