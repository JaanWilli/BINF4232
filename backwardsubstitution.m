function x = backwardsubstitution(U,y)

    n = size(U,1);
    x = zeros(n,1);

    x(n) = y(n)/U(n,n);
    for i = n-1:-1:1
        for j = i+1:n
            y(i) = y(i) - U(i,j)*x(j);
        end
        x(i) = y(i)/U(i,i);
    end
end