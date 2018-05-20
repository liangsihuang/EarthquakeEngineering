function d=StoreyDrift(j,mode,U)
[m,n]=size(U);
d=zeros(m,1);
for i=1:n
    d=d+mode(j,i)*U(:,i);
end
end