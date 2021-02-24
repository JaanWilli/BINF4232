function y = lagrange(xdata, ydata, x)

    n = length(xdata); % n pairs of data -> polynomial of degree n-1
    xdata = reshape(xdata, [], 1); % converted to column
    ydata = reshape(ydata, [], 1); % converted to column

    sizx = size(x);
    x = reshape(x, [], 1);
    y = zeros(length(x), 1);
    for i = 1:n
        tmp = ones(length(x), 1);
        for j = 1:n
            if i ~= j
                tmp = tmp .* (x - xdata(j)) / (xdata(i)-xdata(j));
            end
        end 

        y = y + ydata(i)*tmp;
    end 
    
    y = reshape(y, sizx);
end