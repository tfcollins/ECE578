%Question 2
x=[1 0 0 1 0 0 1 0 0 1 1 0 1 1 0 1 1 0 0 1 0 0 1 0 0 1 1 0];
y=[1 0 1 1 1 1 0 0 0 0 1 1 0 0 0 1 0 0 1 0 1 0 1 1 0 0 0 1];

x=xor(x,y);
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
        F=inv(X)*X_t;
        break; %Coeffs found
    end
end


%%LFSR
initial=[1 0 0];
taps=F';
output=[];
for i=1:14
    output=[output initial(end)];
    new=mod(sum(initial.*taps),2);
    initial(2:length(initial))=initial(1:length(initial)-1);
    initial(1)=new;
end
%Visual Check
[output(1:14)' key(1:14)']