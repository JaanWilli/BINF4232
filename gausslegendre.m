function I = gausslegendre(f,a,b,n)

    [x,w] = glnw(n,a,b); % nodes and weights of gauss-legendre(-lobatto)
    
    I = 0;
    for k = 1:length(x)
        I = I + w(k)*f(x(k));
    end
end



function [x,w]=glnw(N,a,b)
% compute Gauss-Legendre nodes and weights 
    N1=N+1; N2=N+2;
    xu=linspace(-1,1,N1)';
    % Initial guess
    y=cos((2*(0:N)'+1)*pi/(2*N+2))+(0.27/N1)*sin(pi*xu*N/N2);
    % Legendre-Gauss Vandermonde Matrix
    L=zeros(N1,N2);
    % Derivative of LGVM
    Lp=zeros(N1,N2);
    % Compute the zeros of the N+1 Legendre Polynomial
    % using the recursion relation and the Newton-Raphson method
    y0=2;
    % Iterate until new points are uniformly within epsilon of old points
    while max(abs(y-y0))>eps
        L(:,1)=1;
        Lp(:,1)=0;
        L(:,2)=y;
        Lp(:,2)=1;
        for k=2:N1
            L(:,k+1)=( (2*k-1)*y.*L(:,k)-(k-1)*L(:,k-1) )/k;
        end
        Lp=(N2)*( L(:,N1)-y.*L(:,N2) )./(1-y.^2);   
        y0=y;
        y=y0-L(:,N2)./Lp;
    end
    % Linear map from[-1,1] to [a,b]
    x=(a*(1-y)+b*(1+y))/2;      
    % Compute the weights
    w=(b-a)./((1-y.^2).*Lp.^2)*(N2/N1)^2;
end

function [x,w]=gllnw(N)
% compute Gauss-Legendre-Lobatto nodes and weights

    N1=N+1;
    % Use the Chebyshev-Gauss-Lobatto nodes as the first guess
    x=cos(pi*(0:N)/N)';
    % The Legendre Vandermonde Matrix
    P=zeros(N1,N1);
    % Compute P_(N) using the recursion relation
    % Compute its first and second derivatives and 
    % update x using the Newton-Raphson method.
    xold=2;
    while max(abs(x-xold))>eps
        xold=x;
        P(:,1)=1;
        P(:,2)=x;
        for k=2:N
            P(:,k+1)=( (2*k-1)*x.*P(:,k)-(k-1)*P(:,k-1) )/k;
        end
        x=xold-( x.*P(:,N1)-P(:,N) )./( N1*P(:,N1) );
    end
    w=2./(N*N1*P(:,N1).^2);
end