function PlotMode(mode,k)
% ���룺
% ���;���mode
% ��k��
[n,~]=size(mode);
x=zeros(n+1,1);
y=zeros(n+1,1);
x(1)=0;
y(1)=0;
scale=0.5;
for i=2:n+1
    x(i)=mode(i-1,k);
    y(i)=(i-1)*scale;
end
plot(x,y);
daspect([1 1 1]);
title(['��' num2str(k) '������']);
end