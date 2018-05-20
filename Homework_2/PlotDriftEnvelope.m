function PlotDriftEnvelope(mode,U)
[m,n]=size(U);
d=zeros(m,1);
x=zeros(n+1,1);
y=zeros(n+1,1);
x(1)=0;
y(1)=0;
scale=1;
for j=1:n % 质点
    for i=1:n % 振型
        if j==1
            d=d+mode(j,i)*U(:,i);
        else
            disp1=mode(j-1,i)*U(:,i);
            disp2=mode(j,i)*U(:,i);
            d=d+disp2-disp1;
        end
    end
    x(j+1)=max(abs(d));
    y(j+1)=j*scale;
end
plot(x,y);
daspect([1 2000 1]);
title('各层层间位移绝对值最大值包络图');
end