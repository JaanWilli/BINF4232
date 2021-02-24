function [A] = qr_iteration(A,tol)

    err = tol+1;
    iter = 0;
    
    while err > tol && iter < 1000
        iter = iter + 1;
        
        [Q,R] = qr(A);
        A = R*Q;
        err = max(max(tril(A,-1)));
    end
end

