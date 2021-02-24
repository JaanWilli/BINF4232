function I = trapezoid(f,a,b,M)

    H = (b-a)/M;
    x = linspace(a,b,M+1);
    I = 0;
    
    for k = 1:M-1
        I = I + f(x(k));
    end
    I = H/2*(f(x(1)) + 2*I + f(x(M)));
end