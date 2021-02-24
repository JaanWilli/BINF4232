function x = sor_componentwise(A,b,x0,omega,tol)

    w = omega;
    n = size(x0,1);
    err = tol+1;
    x = x0;
    
    while err > tol
        for i = 1:n
            sum1 = 0;
            for j = 1:i-1
                sum1 = sum1 + A(i,j)*x(j);
            end
            sum2 = 0;
            for j = i+1:n
                sum2 = sum2 + A(i,j)*x0(j);
            end
            x(i) = (1-w)*x0(i) + w/A(i,i)*(b(i)-sum1-sum2);
        end
        err = norm(A*x-b);
        x0 = x;
    end
end