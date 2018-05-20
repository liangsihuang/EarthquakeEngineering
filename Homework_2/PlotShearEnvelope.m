function PlotShearEnvelope(mode,U,kk)
[~,n]=size(U);
x=zeros(2*n,1);
y=zeros(2*n,1);
scale=1;
for j=1:n % 质点
    d=InterStoreyDrift(j,mode,U);
    shear=kk(j)*d;
    x(2*j-1)=max(abs(shear));
    y(2*j-1)=(j-1)*scale;
    x(2*j)=x(2*j-1);
    y(2*j)=j*scale;
end
plot(x,y);
daspect([1 1e-4 1]);
title('各层层间剪力绝对值最大值包络图');
xlabel('剪力（N）');
ylabel('层数')
end