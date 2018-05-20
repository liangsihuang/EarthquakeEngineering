function PlotShearEnvelope(mode,U,kk)
[~,n]=size(U);
x=zeros(n,1);
y=zeros(n,1);
scale=1;
for j=1:n % 质点
    d=InterStoreyDrift(j,mode,U);
    shear=kk(j)*d;
    x(j)=max(abs(shear));
    y(j)=(j-1)*scale;
end
plot(x,y);
daspect([1 1e-4 1]);
title('各层层间剪力绝对值最大值包络图');
xlabel('剪力（N）');
end