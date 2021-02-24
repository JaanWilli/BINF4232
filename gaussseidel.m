function x = gaussseidel(A,b,x0,tol)

    err = tol+1;
    P = tril(A);
    
    while err > tol
        x = x0 + inv(P)*(b-A*x0);
        err = norm(x-x0);
        x0 = x;
    end
end