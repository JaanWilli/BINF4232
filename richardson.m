function I = richardson(f,a,b,M1,M2)
    
    % step sizes
    H1 = (b-a)/M1;
    H2 = (b-a)/M2;
    
    I1 = trapezoid(f,a,b,M1);
    I2 = trapezoid(f,a,b,M2);
    
    % general formula
    I = I2 + 1/((H1/H2)^2-1) * (I2-I1);
end