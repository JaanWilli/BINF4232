function I = simpson(f,a,b,M)

    H = (b-a)/M;
    x = linspace(a,b,M+1);
    I = 0;
    
    for k = 1:M
        xq = (x(k+1)+x(k))/2;
        I = I + f(x(k)) + 4*f(xq) + f(x(k+1));
    end
    I = H/6 * I;
end