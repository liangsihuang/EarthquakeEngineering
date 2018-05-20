function d=InterStoreyDrift(j,mode,U)
[m,n]=size(U);
d=zeros(m,1);
for i=1:n
    if j==1
        d=d+mode(j,i)*U(:,i);
    else
        disp1=mode(j-1,i)*U(:,i);
        disp2=mode(j,i)*U(:,i);
        d=d+disp2-disp1;
    end
end
end