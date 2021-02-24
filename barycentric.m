function [p]=barycentric(xdata, ydata, x)
    
    % Interpolates the given data using the Barycentric
    % Lagrange Interpolation formula. Vectorized to remove all loops
    %
    % data - a two column vector where column one contains the
    %        nodes and column two contains the function value 
    %        at the nodes
    % p - interpolated data. Column one is just the 
    %     fine mesh x, and column two is interpolated data 
    %
    data = [xdata,ydata];
    n=length(data);     
    sizx=length(x);
    % Compute the barycentric weights
    X=repmat(data(:,1),1,n);
    % matrix of weights
    W=repmat(1./prod(X-X.'+eye(n),1),sizx,1);
    % Get distances between nodes and interpolation points
    xdist=repmat(x,1,n)-repmat(data(:,1).',sizx,1);
    % Find all of the elements where the interpolation point is on a node
    [fixi,fixj]=find(xdist==0);
    % Use NaNs as a place-holder
    xdist(fixi,fixj)=NaN;
    H=W./xdist;
    % Compute the interpolated polynomial
    p=(H*data(:,2))./sum(H,2);
    % Replace NaNs with the given exact values. 
    p(fixi)=data(fixj,2);
end