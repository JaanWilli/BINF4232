function x = jacobi(A,b,x0,tol)

    P = diag(diag(A));
    err = norm(b);
    
    while err > tol
        add = inv(P)*(b-A*x0);
        x = x0 + add;
        err = norm(add)/norm(b);
        %err = norm(A*x-b);
        x0 = x;
    end
end