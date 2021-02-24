function x = jacobi_componentwise(A,b,x0,tol)
   
    n = length(x0);
    err = tol+1;
    x = zeros(n,1);
    
    while err > tol
        for i = 1:n
            sum = 0;
            for j = 1:n
                if i~=j
                    sum = sum + A(i,j)*x0(j);
                end
            end
            x(i) = 1/A(i,i)*(b(i)-sum);
        end
        err = norm(A*x'-b);
        x0 = x';
    end
end