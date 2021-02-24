function x = gradientmethod(grad, H, x0, tol)

    % grad handle function for the gradient of the function f
    % H handle function for the Hessian of the function f
    % x0 initial guess
    % tol tolerance  to stop the method when ||x(k) ? x(k?1)|| < tol

    err=tol+1;
    
    while err > tol
        
        % step direction
        d = -grad(x0);
        
        % step size
        A = H(x0);
        alpha = (d'*d)/(d'*A*d);
        
        x = x0 + alpha*d;
        err=norm(x - x0);
        x0 = x;
    end
end