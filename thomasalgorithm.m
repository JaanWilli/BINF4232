function x = thomasalgorithm( a, e, c, b )
%  Solve the  n x n  tridiagonal system for y:
%
%  [ a(1)  c(1)                                  ] [  y(1)  ]   [  f(1)  ]
%  [ b(2)  a(2)  c(2)                            ] [  y(2)  ]   [  f(2)  ]
%  [       b(3)  a(3)  c(3)                      ] [        ]   [        ]
%  [            ...   ...   ...                  ] [  ...   ] = [  ...   ]
%  [                    ...    ...    ...        ] [        ]   [        ]
%  [                        b(n-1) a(n-1) c(n-1) ] [ y(n-1) ]   [ f(n-1) ]
%  [                                 b(n)  a(n)  ] [  y(n)  ]   [  f(n)  ]
%
%  f must be a vector (row or column) of length n
%  a, b, c must be vectors of length n (note that b(1) and c(n) are not used)
% some additional information is at the end of the file
    n = length(b);
    beta = zeros(n,1);
    alpha = zeros(n,1);
    alpha(1) = a(1);
    for i=2:n
        beta(i) = c(i-1)/alpha(i-1);
        alpha(i) = a(i) - e(i)*beta(i);
        
        %beta(i) = e(i)/a(i-1);
        %alpha(i) = a(i) - beta(i)*c(i-1);
    end

    L = diag(ones(n,1),0) + diag(beta(2:n),-1);
    U = diag(alpha,0) + diag(c(1:n-1),1);
    
    y = L\b;
    x = U\y;
end