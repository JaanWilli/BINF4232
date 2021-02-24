function [x,err,iter] = gaussnewton(R, JR, b, x0, tol, nmax, varargin)

    % solves the nonlinear least squares by the Gauss-Newton method.
    % R is the function handle of the model functions [r1, r2, ..., rn]
    % JR is the function handle of the Jacobian of R w.r.t to [x1, .., xm]
    % b vector of known data
    % X0 is the initial point. TOL is the tolerance for the stopping test,
    % KMAX is the maximum number of allowed iterations.

    err = tol + 1;
    iter = 0;
    
    Rx0 = R(x0, varargin{:});
    JRx0 = JR(x0, varargin{:});
    
    while err > tol && iter < nmax
        iter = iter + 1;
        
        p = (JRx0'*JRx0)\(JRx0'*(b-Rx0));
        x = x0 + p;
        err = norm(x - x0);
        
        Rx0 = R(x, varargin{:});
        JRx0 = JR(x, varargin{:});
        
        x0 = x;
    end
end