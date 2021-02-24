function [Q, R] = qr_factorization(A)
    Q = gramschmidt(A);
    R = Q.' * A;
end

