function [Q, R] = qr_factorization_componentwise(A)

    n = length(A);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
        v = A(:,i);
        for j = 1:i-1
            R(j,i) = Q(:,j).' * A(:,i);
            v = v - (R(j,i) * Q(:,j));
        end
        
        R(i,i) = norm(v);
        Q(:,i) = v/R(i,i);
    end
end

