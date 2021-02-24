function x = fixedpoint(f, x0, tol)

    err=tol+1;
    while err > tol
        x=f(x0);
        err=abs(x0-x);
        x0=x;
    end
end