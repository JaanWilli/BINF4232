function I = adaptivequadrature(f,a,b,tol)

    % recursively applies simpson until tolerance is reached
    mid = (a+b)/2;
    I = simpson(f,a,mid,1) + simpson(f,mid,b,1);
    Itot = simpson(f,a,b,1);
    
    if abs(I - Itot) > tol
        I = adaptivequadrature(f,a,mid,tol/2) + adaptivequadrature(f,mid,b,tol/2);
    end
end