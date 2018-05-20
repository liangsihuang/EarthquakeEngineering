function [u,v,a]=NewmarkMethod(gama,beta,ga,k,m,c,dt)
% 专门计算地震作用，求解方程 m(ddx)+c(dx)+kx=p(p=-m*ga)
% 输入：
% 算法参数gama, beta
% gama=1/2, beta=1/4时是平均常加速度
% gama=1/2, beta=1/6时是线性加速度
% 地震动向量ga
% 单质点体系的刚度k，质量m，阻尼c，计算时间间距dt
% 输出：单质点体系的位移，速度，加速度反应向量

p=-m*ga;
nc=length(p);
u=zeros(nc,1);
v=zeros(nc,1);
a=zeros(nc,1);

% 需要给定初位移和初速度
u(1)=0;
v(1)=0;
% 初加速度根据运动方程算
a(1)=(p(1)-c*v(1)-k*u(1))/m;
% parameters
k_hat=k+gama/beta/dt*c+1/beta/dt^2*m;%u(i+1)前系数
a1=1/beta/dt^2*m+gama/beta/dt*c;%u(i)前系数
a2=1/beta/dt*m+(gama/beta-1)*c;%v(i)前系数
a3=(1/2/beta-1)*m+dt*(gama/2/beta-1)*c;%a(i)前系数
% calculation for time step i
for i=2:nc
    p_hat=p(i)+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u(i)=p_hat/k_hat;
    v(i)=gama/beta/dt*(u(i)-u(i-1))+(1-gama/beta)*v(i-1)...
        +dt*(1-gama/2/beta)*a(i-1);
    %a(i)=1/beta/dt^2*(u(i)-u(i-1))-1/beta/dt*v(i-1)-(1/2/beta-1)*a(i-1);
    %加速度不用递推公式，而用运动方程反算，强行满足运动方程
    a(i)=(p(i)-c*v(i)-k*u(i))/m;
end

end