%Question 1
x=[0 1 0 1 0 1 0 1 0 1 0 1 0 1];
x=[0 1 1 0 0 1 1 0 0 1 1 0];
for m=2:8
    X=ones(m,m)*2;
    X_t=ones(m,1)*2;
    for j=1:m
        for i=1:m
            X(i,j)=x(i+j-1);
        end
    end
    %[X_m;X_m+1..];
    X_t=x(m+1:m+m)';
    
    X=double(flipdim(X,2));
    disp(['m: ',num2str(m),' Determinate: ',num2str(det(X)),' Rank: ',num2str(rank(X))]);
    if rank(X)==m
        F=inv(X)*X_t
    end
end