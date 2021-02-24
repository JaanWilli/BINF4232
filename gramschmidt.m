function e = gramschmidt(u)

    n = length(u);
    e(:,1) = u(:,1)/norm(u(:,1));
    for i = 2:n
        e(:,i) = u(:,i);
        for j = 1:i-1
            e(:,i) = e(:,i) - dot(u(:,i),e(:,j))*e(:,j);
        end
        e(:,i) = e(:,i)/norm(e(:,i));
    end
end

