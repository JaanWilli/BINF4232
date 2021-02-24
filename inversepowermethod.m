function [ev,ew] = inversepowermethod(A,x0,tol)

    % inverse power method to compute smallest eigenvalue
    
    y = x0/norm(x0);
    err = tol+1;
    lam0 = 0;
   
    while err > tol
        x = inv(A)*y;
        y = x/norm(x);
        lam1 = y'*inv(A)*y;
        err = abs(lam1-lam0)/abs(lam1);
        lam0 = lam1;
    end

    ev = y;
    ew = 1/lam1;
end