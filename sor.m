function x = sor(A,b,x0,omega,tol)

    w = omega;
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    err = tol+1;
    
    P = D/w - L;
        
    while err > tol
        %x = inv(D + w*L)*(w*b - (w*U + (w-1)*D)*x0);
        %x = (eye(length(A))-inv(D/w - L)*A)*x0 + inv(D/w - L)*b;
        x = x0 + inv(P)*(b-A*x0);
        err = norm(A*x-b);
        x0 = x;
    end
end