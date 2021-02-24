x = linspace(0,2*pi,10)'; % xpoints that should be interpolated
y = sin(x); % function

u = linspace(x(1),x(end),1000)'; % linspace over x

ys = spline(x,y,u);

plot(x,y,'bo',u,ys,'r-')