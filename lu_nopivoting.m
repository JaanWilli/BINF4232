function [L,U,b] = lu_nopivoting(A,b)

    %returns the matrices L and U of the Gauss LU decomposition of A.
    %
    % INPUT: A Square matrix, assumed invertible, and solvable without row
    %           interchanges.
    %        b optional vector
    % OUTPUT: L lower triangular matrix
    %         U upper triangular matrix

    n=size(A,1);
    if(size(A,2) ~= n)
        error("A is not a square matrix")
    end
    
    L = eye(n);
    
    for i = 1:n-1
        for j = i+1:n
            % compute the multipliers and store them in the matrix A
            L(j,i) = A(j,i)/A(i,i);
            % subtract multiples of line k from the next lines
            for k = i+1:n
                A(j,k) = A(j,k) - L(j,i)*A(i,k);
            end
            
            if nargin == 2
                b(j) = b(j) - L(j,i)*b(i);
            end
        end
    end

    % SHORT FORM
    %for i=1:n-1
    %    L(i+1:n,i) = A(i+1:n,i)/A(i,i);
    %    A(i+1:n,i+1:n) = A(i+1:n,i+1:n)-L(i+1:n,i)*A(i,i+1:n);
    %end

    U = triu(A);
    
end