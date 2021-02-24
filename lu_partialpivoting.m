function [L,U,P] = lu_partialpivoting(A)

    n = size(A,1); 
    L = eye(n); 
    P = eye(n); 
    U = A;
    for i = 1:n-1
        [pivot, p] = max(abs(U(i:n, i))); 
        disp(p)
        p = p + i - 1; % p is the index of the largest el starting to count at i
        if p ~= i
            U([p,i],:) = U([i,p],:);   % interchange rows i and p in U
            P([p,i],:) = P([i,p],:);   % interchange rows i and p in P
            if i >= 2    % very_important_point
                L([p,i],1:i-1) =  L([i,p],1:i-1);   % interchange rows i and p in columns 1:i-1 of L
            end
        end
        for j = i+1:n      
            L(j,i) = U(j,i) / U(i,i);
            
            for k = i+1:n
                U(j,k) =  U(j,k) - L(j,i)*U(i,k);
            end
        end
    end
    
    U = triu(U);
end