function [t, y] = explicitEuler(f,t,y0)

N=length(t);
y=size(length(y0),N);
y(1,:)=y0;
for i=2:N
    step = t(i) - t(i-1);
    y(i,:) = y(i-1,:) + step * f(t(i-1),y(i-1,:));
end

end

