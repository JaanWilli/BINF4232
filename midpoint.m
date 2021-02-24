function I = midpoint(f,a,b,M)

    H = (b-a)/M; % length of composite parts
    x = linspace(a,b,M+1); % points to evaluate
    I = 0;
    
    for k = 1:M
        I = I + f((x(k)+x(k+1))/2);
    end
    I = H * I;
end