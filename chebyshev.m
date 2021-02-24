function x = chebyshev(a,b,n)

    x = zeros(n,1);
    for i = 1:n
        t = cos((2*i-1)/(2*n)*pi);
        x(i) = (a+b)/2 + (b-a)/2*t;
    end
end