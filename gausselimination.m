function x = gausselimination(A,b)

    % forward elimination
    [L,A,b] = lu_nopivoting(A,b);
    
    % back substitution (get x)
    x = backwardsubstitution(A,b);
end