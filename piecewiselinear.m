x = linspace(0,2*pi,10)';
y = sin(x);

u = linspace(x(1),x(end),1000)';

yinterp1 = interp1(x,y,u,'linear');

plot(x,y,'bo',u,yinterp1,'r-')