function R = cholR(A)

    n = length(A);
    R(1,1) = sqrt(A(1,1));
    for j = 2:n
        for i = 1:j-1
            sum = 0;
            for k = 1:i-1
                sum = sum + R(k,i)*R(k,j);
            end
            R(i,j) = 1/R(i,i)*(A(i,j)-sum);
        end
        sum = 0;
        for k = 1:i-1
            sum = sum + R(k,j)^2;
        end
        R(j,j) = sqrt(A(j,j)-sum);
    end
end