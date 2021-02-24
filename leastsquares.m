x = linspace(0,2*pi,10)'; % xvalues to be interpolated
y = x.^2; % function

coeffs = polyfit(x,y,1); % coefficients of polynomial degree one with least squares
ys = polyval(coeffs,x); % evaluate coefficients to get function values

plot(x,y,'bo',x,ys,'r-')